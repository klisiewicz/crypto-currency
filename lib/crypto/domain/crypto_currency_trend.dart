import 'package:meta/meta.dart';

class TrendHistory {
  final TrendValue hour;
  final TrendValue day;
  final TrendValue week;

  const TrendHistory(
      {@required this.hour, @required this.day, @required this.week})
      : assert(hour != null),
        assert(day != null),
        assert(week != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrendHistory &&
          runtimeType == other.runtimeType &&
          hour == other.hour &&
          day == other.day &&
          week == other.week;

  @override
  int get hashCode => hour.hashCode ^ day.hashCode ^ week.hashCode;
}

class TrendValue {
  final double value;
  final Trend trend;

  const TrendValue({@required this.value, @required this.trend})
      : assert(value != null),
        assert(trend != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrendValue &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          trend == other.trend;

  @override
  int get hashCode => value.hashCode ^ trend.hashCode;
}

enum Trend { rising, falling, standing }
