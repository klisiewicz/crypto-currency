import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class TrendHistory extends Equatable {
  final TrendValue hour;
  final TrendValue day;
  final TrendValue week;

  const TrendHistory({
    @required this.hour,
    @required this.day,
    @required this.week,
  })
      : assert(hour != null),
        assert(day != null),
        assert(week != null);

  @override
  List<Object> get props => [hour, day, week];
}

class TrendValue extends Equatable {
  final double value;
  final Trend trend;

  const TrendValue({
    @required this.value,
    @required this.trend,
  })
      : assert(value != null),
        assert(trend != null);

  @override
  List<Object> get props => [value, trend];
}

enum Trend { rising, falling, standing }
