import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CryptoCurrency extends Equatable {
  final int id;
  final String name;
  final String symbol;

  CryptoCurrency({
    @required this.id,
    @required this.name,
    @required this.symbol,
  })
      : assert(id != null),
        assert(name != null),
        assert(symbol != null),
        super([
        id,
        name,
        symbol,
      ]);

  @override
  String toString() => '$name ($symbol)';
}
