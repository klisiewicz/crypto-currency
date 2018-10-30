import 'package:crypto_currency/crypto/domain/crypto_currency.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_service.dart';
import 'package:crypto_currency/crypto/web/coin_market_cap_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';

import '../domain/crypto_currency_test_data.dart';
import 'coin_market_cap_response.dart';

void main() {
  test("should parse valid response from coin market cap", () async {
    // Given:
    final CryptoCurrencyService cryptoCurrencyService =
        CoinMarketCapCurrencyService(MockClient((request) async {
      return validResponse;
    }));

    // When:
    final Iterable<CryptoCurrency> cryptoCurrencies =
        await cryptoCurrencyService.fetchAll();

    // Then:
    final cryptoCurrenciesList = cryptoCurrencies.toList();
    expect(cryptoCurrenciesList.length, 2);
    expect(cryptoCurrenciesList[0], bitCoin);
    expect(cryptoCurrenciesList[1], liteCoin);
  });
}