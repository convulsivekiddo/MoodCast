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

  Future<List<Forecast>> fetchWeekForecast(String cityName);
}

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<Weather> fetchWeather(String cityName) async {
    const baseUrl = Constants.baseUrl;
    const apiKey = Constants.apiKey;

    final response = await http.get(
      Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'),
    );
    if (response.statusCode != 200) {
      throw Exception(Constants.loadingWeatherExceptionText);
    }
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
  Future<List<Forecast>> fetchWeekForecast(String cityName) async {
    const baseUrl = Constants.baseWeekUrl;
    const apiKey = Constants.apiKey;

    final response = await http.get(
      Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'),
    );

    if (response.statusCode != 200) {
      throw Exception(Constants.loadingForecastExceptionText);
    }
    try {
      final jsonResponse = jsonDecode(response.body);
      List<dynamic> weatherList = jsonResponse['list'];
      return Forecast.fromJsonList(weatherList);
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
