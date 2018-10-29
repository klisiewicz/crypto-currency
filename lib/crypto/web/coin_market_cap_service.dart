import 'dart:convert';

import 'package:crypto_currency/crypto/domain/crypto_currency.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_service.dart';
import 'package:crypto_currency/crypto/web/coin_market_cap_response.dart';
import 'package:http/http.dart';

class CoinMarketCapCurrencyService implements CryptoCurrencyService {
  static const _url = 'https://api.coinmarketcap.com/v2/listings/';

  final Client client;

  CoinMarketCapCurrencyService(this.client);

  @override
  Future<Iterable<CryptoCurrency>> fetchAll() async {
    return client
        .get(Uri.parse(_url))
        .then((Response response) => response.body)
        .then(json.decode)
        .then((parsedJson) => CoinMarketCapResponse.fromJson(parsedJson))
        .then(
            (coinMarketCapResponse) => _toCurrencyRates(coinMarketCapResponse));
  }

  _toCurrencyRates(CoinMarketCapResponse coinMarketCapResponse) =>
      coinMarketCapResponse.data.map((CoinMarketCapCurrency it) =>
          CryptoCurrency(id: it.id, name: it.name, symbol: it.symbol));
}
