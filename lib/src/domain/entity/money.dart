import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Money with EquatableMixin {
  final double amount;
  final String currency;

  const Money({
    required this.amount,
    required this.currency,
  });

  @override
  List<Object> get props => [amount, currency];
}
