import 'package:crypto_currency/crypto/domain/crypto_currency.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_supply.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_trend.dart';
import 'package:crypto_currency/crypto/domain/money.dart';
import 'package:meta/meta.dart';

class CryptoCurrencyRate {
  final CryptoCurrency cryptoCurrency;
  final Supply supply;
  final Money price;
  final double marketCap;
  final TrendHistory trendHistory;

  const CryptoCurrencyRate(
      {@required this.cryptoCurrency,
        @required this.supply,
      @required this.price,
        @required this.marketCap,
        @required this.trendHistory})
      : assert(cryptoCurrency != null),
        assert(price != null),
        assert(supply != null),
        assert(trendHistory != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCurrencyRate &&
          runtimeType == other.runtimeType &&
          cryptoCurrency == other.cryptoCurrency &&
          price == other.price &&
          marketCap == other.marketCap &&
          supply == other.supply &&
          trendHistory == other.trendHistory;

  @override
  int get hashCode =>
      cryptoCurrency.hashCode ^
      price.hashCode ^
      marketCap.hashCode ^
      supply.hashCode ^
      trendHistory.hashCode;
}
