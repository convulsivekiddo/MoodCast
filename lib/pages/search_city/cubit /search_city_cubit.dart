import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/daily_forecast.dart';
import '../../../models/weather.dart';
import '../../../repositories/weather_repository.dart';

part 'search_city_state.dart';

part 'search_city_cubit.freezed.dart';

class SearchCityCubit extends Cubit<SearchCityState> {
  final BuildContext context;

  SearchCityCubit({
    required this.context,
  }) : super(
          SearchCityState(
            controller: TextEditingController(),
          ),
        );

  WeatherRepository get _repository => context.read<WeatherRepository>();

  Future<void> getWeatherByCityName() async {
    emit(state.copyWith(status: SearchCityStatus.loading));

    try {
      final cityName = state.controller.text;
      final weather = await _repository.fetchWeather(
        cityName,
      );
      final forecast = await _repository.fetchWeekForecast(cityName);

      if (isClosed) return;
      emit(state.copyWith(
        weather: weather,
        forecast: forecast,
        status: SearchCityStatus.success,
      ));
    } on Exception {
      if (isClosed) return;
      emit(state.copyWith(
        status: SearchCityStatus.error,
      ));
    } finally {
      _clearStatuses();
    }
  }

  void _clearStatuses() {
    emit(state.copyWith(status: SearchCityStatus.initial));
  }
}
