import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Supply extends Equatable {
  final double circulating;
  final double max;

  const Supply({
    this.circulating,
    this.max,
  });

  @override
  List<Object> get props => [circulating, max];
}
