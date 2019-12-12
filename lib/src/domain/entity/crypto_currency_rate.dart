import 'package:crypto_currency/src/domain/entity/crypto_currency.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_supply.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_trend.dart';
import 'package:crypto_currency/src/domain/entity/money.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class CryptoCurrencyRate extends Equatable {
  final CryptoCurrency cryptoCurrency;
  final Supply supply;
  final Money price;
  final double marketCap;
  final TrendHistory trendHistory;

  const CryptoCurrencyRate({
    @required this.cryptoCurrency,
    @required this.supply,
    @required this.price,
    @required this.marketCap,
    @required this.trendHistory,
  })  : assert(cryptoCurrency != null),
        assert(price != null),
        assert(supply != null),
        assert(trendHistory != null);

  @override
  List<Object> get props =>
      [cryptoCurrency, supply, price, marketCap, trendHistory];

  bool isSatisfiedBy(String query) {
    return _nameContainsQuery(query) || _symbolContainsQuery(query);
  }

  bool _nameContainsQuery(String query) =>
      cryptoCurrency.name.toLowerCase().contains(query.toLowerCase());

  bool _symbolContainsQuery(String query) =>
      cryptoCurrency.symbol.toLowerCase().contains(query.toLowerCase());
}
