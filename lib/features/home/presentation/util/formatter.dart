import 'package:intl/intl.dart';

String formatWeatherTime(int dt, int timezone) {
  final date = DateTime.fromMillisecondsSinceEpoch(
    dt * 1000,
    isUtc: true,
  ).add(Duration(seconds: timezone));

  return DateFormat('EEE,d MMM HH:mm').format(date);
}
