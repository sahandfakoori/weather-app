class SysEntity {
  final int? type;
  final int? id;
  final String country;
  final int sunrise;
  final int sunset;

  SysEntity({
    this.type,
    this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
}
