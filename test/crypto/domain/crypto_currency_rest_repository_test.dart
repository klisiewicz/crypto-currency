import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_rest_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'crypto_currency_test_data.dart';

class _CryptoCurrencyServiceMock extends Mock
    implements CryptoCurrencyRateService {
}

main() {
  CryptoCurrencyRateRepository cryptoCurrencyRepository;
  CryptoCurrencyRateService cryptoCurrencyService;

  setUp(() {
    cryptoCurrencyService = _CryptoCurrencyServiceMock();
    cryptoCurrencyRepository =
        CryptoCurrencyRestRepository(cryptoCurrencyService);
  });

  test("should return crypto currencies from the service", () async {
    // Given:
    when(cryptoCurrencyService.fetchAll()).thenAnswer((_) => new Future.value([
      bitcoinRate, etherumRate
    ]));

    // When:
    final Iterable<CryptoCurrencyRate> cryptoCurrencies =
        await cryptoCurrencyRepository.findAll();

    // Then:
    var cryptoCurrenciesList = cryptoCurrencies.toList();
    expect(cryptoCurrenciesList.length, 2);
    expect(cryptoCurrenciesList[0], bitcoinRate);
    expect(cryptoCurrenciesList[1], etherumRate);
  });
}
