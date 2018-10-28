// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_market_cap_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinMarketCapResponse _$CoinMarketCapResponseFromJson(
    Map<String, dynamic> json) {
  return CoinMarketCapResponse((json['data'] as List)
      ?.map((e) => e == null
          ? null
          : CoinMarketCapCurrency.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$CoinMarketCapResponseToJson(
        CoinMarketCapResponse instance) =>
    <String, dynamic>{'data': instance.data};

CoinMarketCapCurrency _$CoinMarketCapCurrencyFromJson(
    Map<String, dynamic> json) {
  return CoinMarketCapCurrency(
      json['id'] as int, json['name'] as String, json['symbol'] as String);
}

Map<String, dynamic> _$CoinMarketCapCurrencyToJson(
        CoinMarketCapCurrency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol
    };
