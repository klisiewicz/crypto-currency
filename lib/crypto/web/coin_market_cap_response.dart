import 'package:json_annotation/json_annotation.dart';

part 'coin_market_cap_response.g.dart';

@JsonSerializable()
class CoinMarketCapResponse {
  final List<CoinMarketCapCurrency> data;

  CoinMarketCapResponse(this.data);

  factory CoinMarketCapResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketCapResponseFromJson(json);
}

@JsonSerializable()
class CoinMarketCapCurrency {
  final int id;
  final String name;
  final String symbol;

  CoinMarketCapCurrency(this.id, this.name, this.symbol);

  factory CoinMarketCapCurrency.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketCapCurrencyFromJson(json);
}