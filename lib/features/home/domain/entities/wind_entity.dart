class WindEntity {
  final double speed;
  final int? deg;
  final double? gust;

  WindEntity({
    required this.speed,
    this.deg,
    this.gust,
  });
}