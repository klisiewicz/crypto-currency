// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../api/coin_market_cap_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinMarketCapResponse _$CoinMarketCapResponseFromJson(
    Map<String, dynamic> json) {
  return CoinMarketCapResponse((json['data'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : CoinMarketCapCurrency.fromJson(e as Map<String, dynamic>))));
}

CoinMarketCapCurrency _$CoinMarketCapCurrencyFromJson(
    Map<String, dynamic> json) {
  return CoinMarketCapCurrency(
      json['id'] as int,
      json['name'] as String,
      json['symbol'] as String,
      (json['circulating_supply'] as num)?.toDouble(),
      (json['max_supply'] as num)?.toDouble(),
      (json['quotes'] as Map<String, dynamic>)?.map((k, e) => MapEntry(
          k,
          e == null
              ? null
              : CoinMarketQuote.fromJson(e as Map<String, dynamic>))));
}

CoinMarketQuote _$CoinMarketQuoteFromJson(Map<String, dynamic> json) {
  return CoinMarketQuote(
      (json['price'] as num)?.toDouble(),
      (json['market_cap'] as num)?.toDouble(),
      (json['volume'] as num)?.toDouble(),
      (json['percent_change_1h'] as num)?.toDouble(),
      (json['percent_change_24h'] as num)?.toDouble(),
      (json['percent_change_7d'] as num)?.toDouble());
}
