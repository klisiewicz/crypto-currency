import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class TrendHistory with EquatableMixin {
  final TrendValue hour;
  final TrendValue day;
  final TrendValue week;

  const TrendHistory({
    required this.hour,
    required this.day,
    required this.week,
  });

  @override
  List<Object?> get props => [hour, day, week];
}

@immutable
class TrendValue with EquatableMixin {
  final double value;
  final Trend trend;

  const TrendValue({
    required this.value,
    required this.trend,
  });

  @override
  List<Object?> get props => [value, trend];
}

enum Trend { rising, falling, standing }
