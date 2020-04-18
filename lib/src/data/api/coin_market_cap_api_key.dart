import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class CoinMarketCapApiKey extends Equatable {
  final String value;

  CoinMarketCapApiKey(this.value) : assert(value != null && value.isNotEmpty);

  @override
  List<Object> get props => [value];
}
