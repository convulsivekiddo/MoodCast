import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/weather.dart';
import '../../repositories/weather_repository.dart';

part 'home_page_state.dart';

part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final BuildContext context;

  HomePageCubit({
    required this.context,
    required Weather? receivedWeather,
    required List<Weather>? receivedForecast,
  }) : super(
          HomePageState(
            controller: TextEditingController(),
          ),
        ) {
    _init(receivedWeather, receivedForecast);
  }

  WeatherRepository get _repository => context.read<WeatherRepository>();

  Future<void> getWeather() async {
    emit(state.copyWith(status: HomePageStatus.loading));

    try {
      String cityName = await _repository.getCurrentCity();
      final weather = await _repository.fetchWeather(
        cityName,
      );
      if (isClosed) return;
      emit(state.copyWith(
        weather: weather,
        status: HomePageStatus.success,
      ));
    } on Exception {
      if (isClosed) return;
      emit(state.copyWith(
        status: HomePageStatus.error,
      ));
    } finally {
      _clearStatuses();
    }
  }

  Future<void> searchCity() async {
    emit(state.copyWith(status: HomePageStatus.loading));

    try {
      final cityName = state.controller.text;
      final weather = await _repository.fetchWeather(cityName);

      if (isClosed) return;
      emit(
        state.copyWith(
          weather: weather,
          status: HomePageStatus.success,
        ),
      );
    } on Exception {
      if (isClosed) return;
      if (!context.mounted) return;
      throw Exception();
    }
  }

  void _clearStatuses() {
    emit(state.copyWith(
      status: HomePageStatus.initial,
    ));
  }

  void _init(Weather? receivedWeather, List<Weather>? receivedForecast) {
    if (receivedWeather != null) {
      emit(state.copyWith(
        weather: receivedWeather,
      ));
    } else {
      getWeather();
    }
  }

  String getAnimation(String? mainCondition) {
    switch (state.weather?.mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloudy.json';
      case 'smoke':
        return 'assets/sunny_cloudy.json';
      case 'rain':
      case 'shower rain':
      case 'drizzle':
        return 'assets/rainy.json';

      case 'thunderstorm':
        return 'assets/thunderstorm.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  String getQAnimation(String? mainCondition) {
    switch (state.weather?.mainCondition.toLowerCase()) {
      case 'clouds':
        return 'Cloudy';
      case 'mist':
        return 'High Moisture';
      case 'haze':
        return 'Hazy';
      case 'dust':
        return 'Dusty';
      case 'fog':
        return 'Foggy';
      case 'smoke':
        return 'Smoky';

      case 'rain':
        return 'Rainy';
      case 'shower rain':
        return 'Shower Rain';
      case 'drizzle':
        return 'Drizzle';

      case 'thunderstorm':
        return 'Thunderstorm';
      case 'clear':
        return 'Clear';
      default:
        return 'assets/sunny.json';
    }
  }
}
