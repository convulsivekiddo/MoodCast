// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'weather.freezed.dart';
// part 'weather.g.dart';
//
// @freezed
// class Weather with _$Weather {
//   const factory Weather({
//     @JsonKey(
//       name: 'name',
//       includeIfNull: false,
//     )
//     required String cityName,
//     @JsonKey(
//       name: 'main',
//       includeIfNull: false,
//       fromJson: _temperatureFromJson,
//     )
//     required double temperature,
//     @JsonKey(
//       name: 'weather',
//       includeIfNull: false,
//     )
//     required double mainCondition,
//
//   }) = _Weather;
//
//   factory Weather.fromJson(Map<String, dynamic> json) =>
//       _$WeatherFromJson(json);
// }
//
// double _temperatureFromJson(Map<String, dynamic> main) => main['temp']; todo finish with freezed

class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final DateTime date;
  final int dt;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.date,
    required this.dt,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: true),
      dt: json['dt'],
    );
  }
}
