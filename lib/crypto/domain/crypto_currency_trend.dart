import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TrendHistory extends Equatable {
  final TrendValue hour;
  final TrendValue day;
  final TrendValue week;

  TrendHistory({
    @required this.hour,
    @required this.day,
    @required this.week,
  })
      : assert(hour != null),
        assert(day != null),
        assert(week != null),
        super([hour, day, week]);
}

class TrendValue extends Equatable {
  final double value;
  final Trend trend;

  TrendValue({
    @required this.value,
    @required this.trend,
  })
      : assert(value != null),
        assert(trend != null),
        super([value, trend]);
}

enum Trend { rising, falling, standing }
