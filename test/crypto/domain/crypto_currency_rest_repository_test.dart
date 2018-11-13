import 'package:crypto_currency/crypto/cache/cache_policy.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_dao.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_rest_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'crypto_currency_test_data.dart';

class _CryptoCurrencyRateServiceMock extends Mock
    implements CryptoCurrencyRateService {}

class _CryptoCurrencyRateDaoMock extends Mock implements CryptoCurrencyRateDao {
}

class _CachePolicyMock extends Mock implements CachePolicy {}

main() {
  CryptoCurrencyRateRepository cryptoCurrencyRepository;
  CryptoCurrencyRateService cryptoCurrencyRateService;
  CryptoCurrencyRateDao cryptoCurrencyRateDao;
  CachePolicy cachePolicy;

  Iterable<CryptoCurrencyRate> cryptoCurrencies = [];

  setUp(() {
    cryptoCurrencies = [];
    cryptoCurrencyRateService = _CryptoCurrencyRateServiceMock();
    cryptoCurrencyRateDao = _CryptoCurrencyRateDaoMock();
    cachePolicy = _CachePolicyMock();

    cryptoCurrencyRepository = CryptoCurrencyRestRepository(
        cryptoCurrencyRateService, cryptoCurrencyRateDao, cachePolicy);
  });

  void givenServiceReturningCryptoCurrencies() {
    when(cryptoCurrencyRateService.fetchAll())
        .thenAnswer((_) => new Future.value([bitcoinRate, etherumRate]));
  }

  void givenServiceReturningError() {
    when(cryptoCurrencyRateService.fetchAll()).thenThrow(Error());
  }

  void givenDaoReturningCryptoCurrencies() {
    when(cryptoCurrencyRateDao.getAll())
        .thenAnswer((_) => new Future.value([bitcoinRate, etherumRate]));
  }

  void givenExpiredCache() {
    when(cachePolicy.isValid()).thenReturn(false);
  }

  void givenValidCache() {
    when(cachePolicy.isValid()).thenReturn(true);
  }

  Future<void> whenFetchingCryptoCurrencies() async {
    cryptoCurrencies = await cryptoCurrencyRepository.findAll();
    print(cryptoCurrencies);
  }

  void thenCryptoCurrenciesAreReturned() {
    var cryptoCurrenciesList = cryptoCurrencies.toList();
    expect(cryptoCurrenciesList.length, 2);
    expect(cryptoCurrenciesList[0], bitcoinRate);
    expect(cryptoCurrenciesList[1], etherumRate);
  }

  void thenCryptoCurrenciesAreSavedInLocalStorage() {
    verify(cryptoCurrencyRateDao.saveAll(cryptoCurrencies));
  }

  void thenCryptoCurrenciesWereFetchedFromService() {
    verify(cryptoCurrencyRateService.fetchAll()).called(1);
    verifyNever(cryptoCurrencyRateDao.getAll());
  }

  void thenCryptoCurrenciesWereFetchedFromLocalStorage() {
    verify(cryptoCurrencyRateDao.getAll()).called(1);
    verifyNever(cryptoCurrencyRateService.fetchAll());
  }

  test(
      "when cache has expired should return crypto currencies from the service",
          () async {
        // Given:
        givenServiceReturningCryptoCurrencies();
        givenExpiredCache();

        // When:
        cryptoCurrencies = await cryptoCurrencyRepository.findAll();

        print('asserting');
        // Then:
        thenCryptoCurrenciesAreReturned();
        thenCryptoCurrenciesWereFetchedFromService();
      });

  test(
      "when cache has not expired should return crypto currencies from the local storage",
          () async {
        // Given:
        givenServiceReturningCryptoCurrencies();
        givenDaoReturningCryptoCurrencies();
        givenValidCache();

        // When:
        cryptoCurrencies = await cryptoCurrencyRepository.findAll();

        // Then
        thenCryptoCurrenciesAreReturned();
        thenCryptoCurrenciesWereFetchedFromLocalStorage();
      });

  test("should save crypto currencies from the service in the local storage",
          () async {
        givenServiceReturningCryptoCurrencies();
        givenExpiredCache();

        cryptoCurrencies = await cryptoCurrencyRepository.findAll();

        thenCryptoCurrenciesAreSavedInLocalStorage();
      });

  test(
      "should return currencies from local storage when fetching from network fails",
          () async {
        givenServiceReturningError();
        givenDaoReturningCryptoCurrencies();
        givenExpiredCache();

        cryptoCurrencies = await cryptoCurrencyRepository.findAll();

        thenCryptoCurrenciesAreReturned();
      });
}
