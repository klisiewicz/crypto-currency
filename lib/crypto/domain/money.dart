import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Money extends Equatable {
  final double amount;
  final String currency;

  Money({
    @required this.amount,
    @required this.currency,
  })
      : assert(amount != null),
        assert(currency != null),
        super([amount, currency]);
}
