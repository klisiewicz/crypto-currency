import 'package:meta/meta.dart';

class CryptoCurrency {
  final int id;
  final String name;
  final String symbol;

  const CryptoCurrency(
      {@required this.id, @required this.name, @required this.symbol})
      : assert(id != null),
        assert(name != null),
        assert(symbol != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CryptoCurrency &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              symbol == other.symbol;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      symbol.hashCode;

  @override
  String toString() => '$name ($symbol)';
}
