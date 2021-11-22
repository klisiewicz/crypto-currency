import 'dart:convert';
import 'dart:io';

import 'package:crypto_currency/src/data/api/coin_market_cap_api_key_provider.dart';
import 'package:crypto_currency/src/data/api/coin_market_cap_response.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_supply.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_trend.dart';
import 'package:crypto_currency/src/domain/entity/money.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_reate_data_source.dart';
import 'package:http/http.dart';

class CoinMarketCapCryptoCurrencyDataSource
    implements CryptoCurrencyRateDataSource {
  static const _endpointUrl = 'v1/cryptocurrency/listings/latest';

  final String _authority;
  final Client _client;
  final CoinMarketCapApiKeyProvider _apiKeyProvider;

  const CoinMarketCapCryptoCurrencyDataSource(
    this._authority,
    this._client,
    this._apiKeyProvider,
  );

  @override
  Future<List<CryptoCurrencyRate>> getAll() async {
    final uri = Uri.https(_authority, _endpointUrl, _getQueryParams());
    final response = await _client.get(
      uri,
      headers: await _getHeaders(),
    );
    final decodedBody = json.decode(response.body) as Map<String, dynamic>;
    final coinMarketCapResponse = CoinMarketCapResponse.fromJson(decodedBody);
    return coinMarketCapResponse._toCurrencyRates();
  }

  Map<String, String> _getQueryParams() {
    return <String, String>{
      'start': '1',
      'limit': '500',
      'convert': 'USD',
    };
  }

  Future<Map<String, String>> _getHeaders() async {
    final apiKey = await _apiKeyProvider.getApiKey();
    return <String, String>{
      HttpHeaders.contentTypeHeader: ContentType.json.value,
      'X-CMC_PRO_API_KEY': apiKey.value,
    };
  }
}

extension on CoinMarketCapResponse {
  List<CryptoCurrencyRate> _toCurrencyRates() {
    return data.map(
      (CoinMarketCapCurrency it) {
        final currency = CryptoCurrency(
          id: it.id,
          name: it.name,
          symbol: it.symbol,
        );
        final quote = it.quote.values.first;
        return CryptoCurrencyRate(
          cryptoCurrency: currency,
          price: Money(
            amount: quote.price,
            currency: it.quote.keys.first,
          ),
          marketCap: quote.marketCap,
          supply: Supply(
            circulating: it.circulatingSupply,
            max: it.maxSupply,
          ),
          trendHistory: TrendHistory(
            hour: TrendValue(
              value: quote.percentageChangeLastHour.abs(),
              trend: quote.percentageChangeLastHour._getTrend(),
            ),
            day: TrendValue(
              value: quote.percentageChangeLastDay.abs(),
              trend: quote.percentageChangeLastDay._getTrend(),
            ),
            week: TrendValue(
              value: quote.percentageChangeLastWeek.abs(),
              trend: quote.percentageChangeLastWeek._getTrend(),
            ),
          ),
        );
      },
    ).toList();
  }
}

extension on double {
  Trend _getTrend() {
    if (this > 0) {
      return Trend.rising;
    } else if (this == 0) {
      return Trend.standing;
    } else {
      return Trend.falling;
    }
  }
}
