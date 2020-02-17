import 'dart:convert';

import 'package:crypto_currency/src/data/api/coin_market_cap_response.dart';
import 'package:crypto_currency/src/domain/crypto_currency_reate_data_source.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_supply.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_trend.dart';
import 'package:crypto_currency/src/domain/entity/money.dart';
import 'package:http/http.dart';

class CoinMarketCapCryptoCurrencyDataSource
    implements CryptoCurrencyRateDataSource {
  static const _url = 'https://api.coinmarketcap.com/v2/ticker/';

  final Client client;

  const CoinMarketCapCryptoCurrencyDataSource(this.client);

  @override
  Future<List<CryptoCurrencyRate>> getAll() async {
    return client
        .get(Uri.parse(_url))
        .then((Response response) => response.body)
        .then(json.decode)
        .then((parsedJson) =>
            CoinMarketCapResponse.fromJson(parsedJson as Map<String, dynamic>))
        .then(
          (coinMarketCapResponse) => _toCurrencyRates(coinMarketCapResponse),
        );
  }

  List<CryptoCurrencyRate> _toCurrencyRates(
          CoinMarketCapResponse coinMarketCapResponse) =>
      coinMarketCapResponse.data.values.map(
        (CoinMarketCapCurrency it) {
          final currency = CryptoCurrency(
            id: it.id,
            name: it.name,
            symbol: it.symbol,
          );
          final quote = it.quotes.values.first;
          return CryptoCurrencyRate(
            cryptoCurrency: currency,
            price: Money(
              amount: quote.price,
              currency: it.quotes.keys.first,
            ),
            marketCap: quote.marketCap,
            supply: Supply(
              circulating: it.circulatingSupply,
              max: it.maxSupply,
            ),
            trendHistory: TrendHistory(
              hour: TrendValue(
                value: quote.percentageChangeLastHour.abs(),
                trend: _getTrend(quote.percentageChangeLastHour),
              ),
              day: TrendValue(
                value: quote.percentageChangeLastDay.abs(),
                trend: _getTrend(quote.percentageChangeLastDay),
              ),
              week: TrendValue(
                value: quote.percentageChangeLastWeek.abs(),
                trend: _getTrend(quote.percentageChangeLastWeek),
              ),
            ),
          );
        },
      ).toList();

  Trend _getTrend(double percentageChangeLastHour) {
    if (percentageChangeLastHour > 0) {
      return Trend.rising;
    } else if (percentageChangeLastHour == 0) {
      return Trend.standing;
    } else {
      return Trend.falling;
    }
  }
}
