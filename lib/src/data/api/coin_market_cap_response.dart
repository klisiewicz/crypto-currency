import 'package:json_annotation/json_annotation.dart';

part 'coin_market_cap_response.g.dart';

@JsonSerializable()
class CoinMarketCapResponse {
  final List<CoinMarketCapCurrency> data;

  CoinMarketCapResponse(this.data);

  factory CoinMarketCapResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketCapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoinMarketCapResponseToJson(this);
}

@JsonSerializable()
class CoinMarketCapCurrency {
  final int id;
  final String name;
  final String symbol;
  @JsonKey(name: 'circulating_supply')
  final double circulatingSupply;
  @JsonKey(name: 'max_supply')
  final double maxSupply;
  final Map<String, CoinMarketQuote> quote;

  CoinMarketCapCurrency(
    this.id,
    this.name,
    this.symbol,
    this.circulatingSupply,
    this.maxSupply,
    this.quote,
  );

  factory CoinMarketCapCurrency.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketCapCurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CoinMarketCapCurrencyToJson(this);
}

@JsonSerializable()
class CoinMarketQuote {
  final double price;
  @JsonKey(name: 'market_cap')
  final double marketCap;
  @JsonKey(name: 'volume')
  final double volume;
  @JsonKey(name: 'percent_change_1h')
  final double percentageChangeLastHour;
  @JsonKey(name: 'percent_change_24h')
  final double percentageChangeLastDay;
  @JsonKey(name: 'percent_change_7d')
  final double percentageChangeLastWeek;

  CoinMarketQuote(
      this.price,
      this.marketCap,
      this.volume,
      this.percentageChangeLastHour,
      this.percentageChangeLastDay,
      this.percentageChangeLastWeek);

  factory CoinMarketQuote.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketQuoteFromJson(json);

  Map<String, dynamic> toJson() => _$CoinMarketQuoteToJson(this);
}
