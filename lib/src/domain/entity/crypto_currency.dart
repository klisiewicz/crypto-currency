import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class CryptoCurrency with EquatableMixin {
  final int id;
  final String name;
  final String symbol;

  const CryptoCurrency({
    required this.id,
    required this.name,
    required this.symbol,
  });

  @override
  List<Object> get props => [id, name, symbol];

  @override
  String toString() => '$name ($symbol)';
}
