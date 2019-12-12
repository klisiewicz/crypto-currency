import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Money extends Equatable {
  final double amount;
  final String currency;

  const Money({
    @required this.amount,
    @required this.currency,
  })  : assert(amount != null),
        assert(currency != null);

  @override
  List<Object> get props => [amount, currency];
}
