import 'package:json_annotation/json_annotation.dart';

part 'coin_market_cap_response.g.dart';

@JsonSerializable()
class CoinMarketCapResponse {
  final Map<String, CoinMarketCapCurrency> data;

  CoinMarketCapResponse(this.data);

  factory CoinMarketCapResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketCapResponseFromJson(json);
}

@JsonSerializable()
class CoinMarketCapCurrency {
  final int id;
  final String name;
  final String symbol;
  final Map<String, CoinMarketQuote> quotes;

  CoinMarketCapCurrency(this.id, this.name, this.symbol, this.quotes);

  factory CoinMarketCapCurrency.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketCapCurrencyFromJson(json);
}

@JsonSerializable()
class CoinMarketQuote {
  final double price;
  @JsonKey(name: 'percent_change_1h')
  final double percentageChangeLastHour;

  CoinMarketQuote(this.price, this.percentageChangeLastHour);

  factory CoinMarketQuote.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketQuoteFromJson(json);
}
