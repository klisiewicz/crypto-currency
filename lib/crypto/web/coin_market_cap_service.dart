import 'dart:convert';

import 'package:crypto_currency/crypto/domain/crypto_currency.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_service.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_supply.dart';
import 'package:crypto_currency/crypto/web/coin_market_cap_response.dart';
import 'package:http/http.dart';

class CoinMarketCapCurrencyService implements CryptoCurrencyRateService {
  static const _url = 'https://api.coinmarketcap.com/v2/ticker/';

  final Client client;

  CoinMarketCapCurrencyService(this.client);

  @override
  Future<Iterable<CryptoCurrencyRate>> fetchAll() async {
    return client
        .get(Uri.parse(_url))
        .then((Response response) => response.body)
        .then(json.decode)
        .then((parsedJson) => CoinMarketCapResponse.fromJson(parsedJson))
        .then(
            (coinMarketCapResponse) => _toCurrencyRates(coinMarketCapResponse));
  }

  Iterable<CryptoCurrencyRate> _toCurrencyRates(
      CoinMarketCapResponse coinMarketCapResponse) =>
      coinMarketCapResponse.data.values.map(
            (CoinMarketCapCurrency it) {
          final currency =
          CryptoCurrency(id: it.id, name: it.name, symbol: it.symbol);
          var quote = it.quotes.values.first;
          return CryptoCurrencyRate(
            cryptoCurrency: currency,
            price: quote.price,
            marketCap: quote.marketCap,
            supply: Supply(
              circulating: it.circulatingSupply,
              max: it.maxSupply,
            ),
            trendValue: TrendValue(
                value: quote.percentageChangeLastHour.abs(),
                trend: _getTrend(quote.percentageChangeLastHour)),
          );
        },
      );

  _getTrend(double percentageChangeLastHour) {
    if (percentageChangeLastHour > 0)
      return Trend.rising;
    else if (percentageChangeLastHour == 0)
      return Trend.standing;
    else
      return Trend.falling;
  }
}
