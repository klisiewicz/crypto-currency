import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Supply with EquatableMixin {
  final double circulating;
  final double? max;

  const Supply({
    required this.circulating,
    this.max,
  });

  @override
  List<Object?> get props => [circulating, max];
}
