import 'package:crypto_currency/crypto/domain/crypto_currency.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_supply.dart';
import 'package:meta/meta.dart';

class CryptoCurrencyRate {
  final CryptoCurrency cryptoCurrency;
  final Supply supply;
  final double price;
  final double marketCap;
  final TrendValue trendValue;

  const CryptoCurrencyRate(
      {@required this.cryptoCurrency,
        @required this.supply,
      @required this.price,
        @required this.marketCap,
        @required this.trendValue})
      : assert(cryptoCurrency != null),
        assert(price != null),
        assert(supply != null),
        assert(trendValue != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCurrencyRate &&
          runtimeType == other.runtimeType &&
          cryptoCurrency == other.cryptoCurrency &&
          price == other.price &&
          marketCap == other.marketCap &&
          supply == other.supply &&
          trendValue == other.trendValue;

  @override
  int get hashCode =>
      cryptoCurrency.hashCode ^
      price.hashCode ^
      marketCap.hashCode ^
      supply.hashCode ^
      trendValue.hashCode;
}

class TrendValue {
  final double value;
  final Trend trend;

  const TrendValue({this.value, this.trend});
}

enum Trend { rising, falling, standing }
