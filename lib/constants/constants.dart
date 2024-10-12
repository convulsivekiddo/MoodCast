import 'dart:ui';

import 'package:flutter/material.dart';

abstract class Constants {
  static const apiKey = "58dceb172152ecf7a74b4d848ce35547";
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  static const baseWeekUrl = 'https://api.openweathermap.org/geo/1.0/direct';

  static const successText = "Success!";
  static const correctFormText = "Please, correct the form!";
  static const errorText = "Error!";
  static const enterTheCityNameText = "Enter The City Name";
  static const seeWeatherText = "See Weather";
  static const errorCityNotFoundText = "City is not found";
  static const errorCouldntLoadWeather = "Could not load the weather";
  static const welcomeText = "Hello! Welcome to MoodCast!";
  static const startPageText =
      "I am your personal assistant\n for viewing the weather in different cities.";

  static const sunnyImageUrl = 'assets/sunny.json';
  static const cloudyImageUrl = 'assets/cloudy.json';
  static const rainyImageUrl = 'assets/rainy.json';
  static const sunnyCloudyImageUrl = 'assets/sunny_cloudy.json';
  static const thunderstormImageUrl = 'assets/thunderstorm.json';
  static const infinityImageUrl = 'assets/infinity.svg';
  static const rainbowImageUrl = 'assets/rainbow_logo.png';

  //colors
  static const primaryColorBlue = Colors.lightBlue;
  static const scaffoldBackgroundBlue = Color(0xFF4DAFF9);
  static const additionalColorBlue = Colors.blueAccent;

  static const primaryColorOrange = Colors.orange;
  static const scaffoldBackgroundOrange = Colors.orangeAccent;
  static const additionalColorOrange = Colors.deepOrangeAccent;
}
