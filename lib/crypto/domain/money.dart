import 'package:meta/meta.dart';

class Money {
  final double amount;
  final String currency;

  Money({@required this.amount, @required this.currency})
      : assert(amount != null),
        assert(currency != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Money &&
              runtimeType == other.runtimeType &&
              amount == other.amount &&
              currency == other.currency;

  @override
  int get hashCode => amount.hashCode ^ currency.hashCode;
}
