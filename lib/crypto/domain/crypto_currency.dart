import 'package:meta/meta.dart';

class CryptoCurrency {
  final int id;
  final String name;
  final String symbol;

  CryptoCurrency(
      {@required this.id, @required this.name, @required this.symbol})
      : assert(id != null),
        assert(name != null),
        assert(symbol != null);
}
