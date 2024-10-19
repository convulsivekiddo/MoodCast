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
