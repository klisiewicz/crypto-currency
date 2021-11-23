import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class CoinMarketCapApiKey with EquatableMixin {
  final String value;

  CoinMarketCapApiKey(this.value) : assert(value.isNotEmpty);

  @override
  List<Object> get props => [value];
}
