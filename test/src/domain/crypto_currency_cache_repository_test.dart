import 'package:crypto_currency/src/data/cache/cache_policy.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_rate_cache_repository.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_rate_data_storage.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_rate_repository.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_reate_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../util/mocktail_ext.dart';
import 'crypto_currency_test_data.dart';

class _CryptoCurrencyRateServiceMock extends Mock
    implements CryptoCurrencyRateDataSource {}

class _CryptoCurrencyRateDaoMock extends Mock
    implements CryptoCurrencyRateDataStorage {}

class _CachePolicyMock extends Mock implements CachePolicy {}

void main() {
  late CryptoCurrencyRateRepository cryptoCurrencyRepository;
  late CryptoCurrencyRateDataSource cryptoCurrencyDataSource;
  late CryptoCurrencyRateDataStorage cryptoCurrencyDataStorage;
  late CachePolicy cachePolicy;

  List<CryptoCurrencyRate> cryptoCurrencies = [];

  setUp(() {
    cryptoCurrencies = [];
    cryptoCurrencyDataSource = _CryptoCurrencyRateServiceMock();
    cryptoCurrencyDataStorage = _CryptoCurrencyRateDaoMock();
    cachePolicy = _CachePolicyMock();

    cryptoCurrencyRepository = CryptoCurrencyCacheRepository(
      cryptoCurrencyDataSource,
      cryptoCurrencyDataStorage,
      cachePolicy,
    );
  });

  void givenDataStorageReturningCryptoCurrencies() {
    when(cryptoCurrencyDataSource.getAll)
        .thenAnswerFutureValue([bitcoinRate, etherumRate]);
  }

  void givenDataStorageReturningError() {
    when(cryptoCurrencyDataSource.getAll).thenThrow(
      Exception('I have failed my lord'),
    );
  }

  void givenDataSourceReturningCryptoCurrencies() {
    when(cryptoCurrencyDataStorage.getAll)
        .thenAnswerFutureValue([bitcoinRate, etherumRate]);
  }

  void givenExpiredCache() {
    when(cachePolicy.isValid).thenReturn(false);
  }

  void givenValidCache() {
    when(cachePolicy.isValid).thenReturn(true);
  }

  void thenCryptoCurrenciesAreReturned() {
    final cryptoCurrenciesList = cryptoCurrencies.toList();
    expect(cryptoCurrenciesList.length, 2);
    expect(cryptoCurrenciesList[0], bitcoinRate);
    expect(cryptoCurrenciesList[1], etherumRate);
  }

  void thenOnlyBitcoinIsReturned() {
    final cryptoCurrenciesList = cryptoCurrencies.toList();
    expect(cryptoCurrenciesList.length, 1);
    expect(cryptoCurrenciesList[0], bitcoinRate);
  }

  void thenCryptoCurrenciesAreSavedInLocalStorage() {
    verify(() => cryptoCurrencyDataStorage.saveAll(cryptoCurrencies));
  }

  void thenCryptoCurrenciesWereFetchedFromService() {
    verify(cryptoCurrencyDataSource.getAll);
    verifyNever(cryptoCurrencyDataStorage.getAll);
  }

  void thenCryptoCurrenciesWereFetchedFromLocalStorage() {
    verify(cryptoCurrencyDataStorage.getAll);
    verifyNever(cryptoCurrencyDataSource.getAll);
  }

  test(
    'when cache has expired should return crypto currencies from the service',
    () async {
      // Given:
      givenDataStorageReturningCryptoCurrencies();
      givenExpiredCache();

      // When:
      cryptoCurrencies = await cryptoCurrencyRepository.getAll();

      // Then:
      thenCryptoCurrenciesAreReturned();
      thenCryptoCurrenciesWereFetchedFromService();
    },
  );

  test(
    'when cache has not expired should return crypto currencies from the local storage',
    () async {
      // Given:
      givenDataStorageReturningCryptoCurrencies();
      givenDataSourceReturningCryptoCurrencies();
      givenValidCache();

      // When:
      cryptoCurrencies = await cryptoCurrencyRepository.getAll();

      // Then
      thenCryptoCurrenciesAreReturned();
      thenCryptoCurrenciesWereFetchedFromLocalStorage();
    },
  );

  test(
    'should save crypto currencies from the service in the local storage',
    () async {
      givenDataStorageReturningCryptoCurrencies();
      givenExpiredCache();

      cryptoCurrencies = await cryptoCurrencyRepository.getAll();

      thenCryptoCurrenciesAreSavedInLocalStorage();
    },
  );

  test(
    'should return currencies from local storage when fetching from network fails',
    () async {
      givenDataStorageReturningError();
      givenDataSourceReturningCryptoCurrencies();
      givenExpiredCache();

      cryptoCurrencies = await cryptoCurrencyRepository.getAll();

      thenCryptoCurrenciesAreReturned();
    },
  );

  test(
    'should return all currencies when no query is given',
    () async {
      givenDataStorageReturningCryptoCurrencies();
      givenDataSourceReturningCryptoCurrencies();
      givenValidCache();

      cryptoCurrencies = await cryptoCurrencyRepository.getBy(null);

      thenCryptoCurrenciesAreReturned();
    },
  );

  test(
    'should return currencies which name matches the query',
    () async {
      givenDataStorageReturningCryptoCurrencies();
      givenDataSourceReturningCryptoCurrencies();
      givenValidCache();

      cryptoCurrencies = await cryptoCurrencyRepository.getBy('bit');

      thenOnlyBitcoinIsReturned();
    },
  );

  test(
    'should return currencies which symbol matches the query',
    () async {
      givenDataStorageReturningCryptoCurrencies();
      givenDataSourceReturningCryptoCurrencies();
      givenValidCache();

      cryptoCurrencies = await cryptoCurrencyRepository.getBy('bt');

      thenOnlyBitcoinIsReturned();
    },
  );
}
