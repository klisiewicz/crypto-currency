class Supply {
  final double circulating;
  final double max;

  const Supply({this.circulating, this.max});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Supply &&
          runtimeType == other.runtimeType &&
          circulating == other.circulating &&
          max == other.max;

  @override
  int get hashCode => circulating.hashCode ^ max.hashCode;
}
