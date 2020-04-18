// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_market_cap_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinMarketCapResponse _$CoinMarketCapResponseFromJson(
    Map<String, dynamic> json) {
  return CoinMarketCapResponse(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : CoinMarketCapCurrency.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CoinMarketCapResponseToJson(
        CoinMarketCapResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CoinMarketCapCurrency _$CoinMarketCapCurrencyFromJson(
    Map<String, dynamic> json) {
  return CoinMarketCapCurrency(
    json['id'] as int,
    json['name'] as String,
    json['symbol'] as String,
    (json['circulating_supply'] as num)?.toDouble(),
    (json['max_supply'] as num)?.toDouble(),
    (json['quote'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : CoinMarketQuote.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$CoinMarketCapCurrencyToJson(
        CoinMarketCapCurrency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'circulating_supply': instance.circulatingSupply,
      'max_supply': instance.maxSupply,
      'quote': instance.quote,
    };

CoinMarketQuote _$CoinMarketQuoteFromJson(Map<String, dynamic> json) {
  return CoinMarketQuote(
    (json['price'] as num)?.toDouble(),
    (json['market_cap'] as num)?.toDouble(),
    (json['volume'] as num)?.toDouble(),
    (json['percent_change_1h'] as num)?.toDouble(),
    (json['percent_change_24h'] as num)?.toDouble(),
    (json['percent_change_7d'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CoinMarketQuoteToJson(CoinMarketQuote instance) =>
    <String, dynamic>{
      'price': instance.price,
      'market_cap': instance.marketCap,
      'volume': instance.volume,
      'percent_change_1h': instance.percentageChangeLastHour,
      'percent_change_24h': instance.percentageChangeLastDay,
      'percent_change_7d': instance.percentageChangeLastWeek,
    };
