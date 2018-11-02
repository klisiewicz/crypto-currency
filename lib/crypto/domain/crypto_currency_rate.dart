import 'package:crypto_currency/crypto/domain/crypto_currency.dart';
import 'package:meta/meta.dart';

class CryptoCurrencyRate {
  final CryptoCurrency cryptoCurrency;
  final double price;
  final Trend trend;

  const CryptoCurrencyRate(
      {@required this.cryptoCurrency,
      @required this.price,
      @required this.trend})
      : assert(cryptoCurrency != null),
        assert(price != null),
        assert(trend != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCurrencyRate &&
          runtimeType == other.runtimeType &&
          cryptoCurrency == other.cryptoCurrency &&
          price == other.price &&
          trend == other.trend;

  @override
  int get hashCode => cryptoCurrency.hashCode ^ price.hashCode ^ trend.hashCode;
}

enum Trend { rising, falling, standing }
