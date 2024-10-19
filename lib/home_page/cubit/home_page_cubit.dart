import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_prediction/models/daily_forecast.dart';

import '../../models/weather.dart';
import '../../repositories/weather_repository.dart';

part 'home_page_state.dart';

part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final BuildContext context;

  HomePageCubit({
    required this.context,
    required Weather? receivedWeather,
    required List<Forecast>? receivedForecast,
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
      final forecast = await _repository.fetchWeekForecast(cityName);
      if (isClosed) return;
      emit(state.copyWith(
        weather: weather,
        weekForecast: forecast,
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

  void _clearStatuses() {
    emit(state.copyWith(
      status: HomePageStatus.initial,
    ));
  }

  void _init(
    Weather? receivedWeather,
    List<Forecast>? receivedForecast,
  ) {
    if (receivedWeather != null && receivedForecast != null) {
      emit(state.copyWith(
        weather: receivedWeather,
        weekForecast: receivedForecast,
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
}
