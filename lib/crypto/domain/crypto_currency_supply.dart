import 'package:equatable/equatable.dart';

class Supply extends Equatable {
  final double circulating;
  final double max;

  Supply({
    this.circulating,
    this.max,
  }) : super([circulating, max]);
}
