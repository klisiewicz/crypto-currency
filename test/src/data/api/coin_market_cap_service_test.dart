import 'package:crypto_currency/src/data/api/coin_market_cap_api_key_provider.dart';
import 'package:crypto_currency/src/data/api/coin_market_cap_data_source.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_reate_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/crypto_currency_test_data.dart';
import 'coin_market_cap_response.dart';

class CoinMarketCapApiKeyProviderMock extends Mock
    implements CoinMarketCapApiKeyProvider {}

void main() {
  test('should parse valid response from coin market cap', () async {
    // Given:
    final CryptoCurrencyRateDataSource cryptoCurrencyService =
        CoinMarketCapCryptoCurrencyDataSource(
      'auhority.com',
      MockClient((request) async => cryptoCurrencies200Response),
      CoinMarketCapApiKeyProviderMock(),
    );

    // When:
    final Iterable<CryptoCurrencyRate> cryptoCurrencies =
        await cryptoCurrencyService.getAll();

    // Then:
    final cryptoCurrenciesList = cryptoCurrencies.toList();
    expect(cryptoCurrenciesList.length, 2);
    expect(cryptoCurrenciesList[0], bitcoinRate);
    expect(cryptoCurrenciesList[1], etherumRate);
  });
}
