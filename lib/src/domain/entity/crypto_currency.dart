import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class CryptoCurrency extends Equatable {
  final int id;
  final String name;
  final String symbol;

  const CryptoCurrency({
    @required this.id,
    @required this.name,
    @required this.symbol,
  })  : assert(id != null),
        assert(name != null),
        assert(symbol != null);

  @override
  List<Object> get props => [id, name, symbol];

  @override
  String toString() => '$name ($symbol)';
}
