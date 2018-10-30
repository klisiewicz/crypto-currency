import 'package:crypto_currency/crypto/domain/crypto_currency.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rest_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'crypto_currency_test_data.dart';

class _CryptoCurrencyServiceMock extends Mock implements CryptoCurrencyService {
}

main() {
  CryptoCurrencyRepository cryptoCurrencyRepository;
  CryptoCurrencyService cryptoCurrencyService;

  setUp(() {
    cryptoCurrencyService = _CryptoCurrencyServiceMock();
    cryptoCurrencyRepository =
        CryptoCurrencyRestRepository(cryptoCurrencyService);
  });

  test("should return crypto currencies from the service", () async {
    // Given:
    when(cryptoCurrencyService.fetchAll()).thenAnswer((_) => new Future.value([
      bitCoin, liteCoin
    ]));

    // When:
    final Iterable<CryptoCurrency> cryptoCurrencies =
        await cryptoCurrencyRepository.findAll();

    // Then:
    var cryptoCurrenciesList = cryptoCurrencies.toList();
    expect(cryptoCurrenciesList.length, 2);
    expect(cryptoCurrenciesList[0], bitCoin);
    expect(cryptoCurrenciesList[1], liteCoin);
  });
}
