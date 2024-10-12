import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_prediction/constants/constants.dart';
import 'package:http/http.dart' as http;
import '../models/daily_forecast.dart';
import '../models/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(String cityName);

  Future<String> getCurrentCity();
  //todo for 7 days below

  Future<List<Weather>> fetchWeekForecast(String cityName);
}

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<Weather> fetchWeather(String cityName) async {
    const baseUrl = Constants.baseUrl;
    const apiKey = Constants.apiKey;
    final cityNameTest = 'London';
    final response = await http.get(
      Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'),
    );
    if (response.statusCode != 200) throw Exception("Failed loading weather");
    try {
      final weather = Weather.fromJson(
        jsonDecode(response.body),
      );
      return weather;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Weather>> fetchWeekForecast(String cityName) async {
    const baseUrl = Constants.baseWeekUrl;
    const apiKey = Constants.apiKey;

    final response = await http.get(
      Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'),
    );
    if (response.statusCode != 200) throw Exception("Failed loading weather");
    try {
      final data = jsonDecode(response.body);
      final List daily = data['daily']; //todo something is wrong here !!!!
      final forecast = daily.map((json) => Weather.fromJson(json)).toList();

      return forecast;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    String? city = placemarks[0].locality;

    return city ?? "404";
  }
}
