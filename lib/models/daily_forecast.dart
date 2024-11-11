import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_forecast.freezed.dart';
part 'daily_forecast.g.dart';

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    @JsonKey(
      name: 'dt_txt',
      fromJson: _parseDate,
    )
    required String date,
    @JsonKey(
      name: 'main',
      fromJson: _parseTemperature,
    )
    required double temperature,
    @JsonKey(
      name: 'weather',
      fromJson: _parseDescription,
    )
    required String description,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  ///NOTE: Due to the way data is returned
  ///from OpenWeather API, we have to sort it using fromJsonList

  static List<Forecast> fromJsonList(List<dynamic> jsonList) {
    Map<String, List<Forecast>> groupedForecasts = {};

    for (var entry in jsonList) {
      Forecast forecast = Forecast.fromJson(entry);
      String date = forecast.date;

      if (!groupedForecasts.containsKey(date)) {
        groupedForecasts[date] = [];
      }
      groupedForecasts[date]!.add(forecast);
    }

    return groupedForecasts.entries.map((entry) {
      double totalTemp = 0;
      String description = entry.value[0].description;

      for (var forecast in entry.value) {
        totalTemp += forecast.temperature;
      }

      double avgTemp = totalTemp / entry.value.length;

      return Forecast(
        date: entry.key,
        temperature: avgTemp,
        description: description,
      );
    }).toList();
  }
}

String _parseDate(String date) {
  return date.split(' ')[0];
}

double _parseTemperature(Map<String, dynamic> main) {
  return (main['temp'] as num).toDouble();
}

String _parseDescription(List<dynamic> weather) {
  return weather[0]['description'] as String;
}
