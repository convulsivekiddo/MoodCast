import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_prediction/models/daily_forecast.dart';
import 'package:weather_prediction/theme%20/theme.dart';

import '../constants/constants.dart';

class ForecastWidget extends StatelessWidget {
  final List<Forecast>? forecastData;

  const ForecastWidget({super.key, required this.forecastData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: 150,
      child: _buildListViewWidget(context),
    );
  }

  _buildListViewWidget(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: forecastData?.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Constants.forecastWidgetBackgroundColor.withOpacity(
              0.25,
            ),
          ),
          width: 200,
          padding: const EdgeInsets.all(16),
          child: _buildContentWidget(context, index),
        );
      },
    );
  }

  Widget _buildContentWidget(
    BuildContext context,
    int index,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDayWidget(context, index),
        const SizedBox(height: 5),
        _buildTemperatureWidget(context, index),
        const SizedBox(height: 5),
        _buildDescriptionWidget(context, index),
      ],
    );
  }

  Widget _buildDayWidget(
    BuildContext context,
    int index,
  ) {
    return Text(
        forecastData != null && forecastData?[index] != null
            ? _getDayOfWeek(forecastData![index].date)
            : Constants.exceptionDayText,
        style: AppTheme.createWhiteTextStyle(30));
  }

  Widget _buildTemperatureWidget(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          forecastData != null && forecastData?[index] != null
              ? '${forecastData![index].temperature.toStringAsFixed(1)} °C'
              : Constants.exceptionTempText,
          style: AppTheme.createWhiteTextStyle(25),
        ),
        const SizedBox(width: 15),
        Lottie.asset(
          height: 40,
          width: 40,
          _getAnimation(index),
        ),
      ],
    );
  }

  Widget _buildDescriptionWidget(BuildContext context, int index) {
    return Text(
      forecastData![index].description,
      style: AppTheme.createWhiteTextStyle(
        15,
        bold: true,
      ),
    );
  }

  String _getDayOfWeek(String date) {
    DateTime parsedDate = DateTime.parse(date);

    List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return days[parsedDate.weekday - 1];
  }

  String _getAnimation(int index) {
    switch (forecastData![index].description.toLowerCase()) {
      case 'few clouds':
      case 'scattered clouds':
      case 'broken clouds':
      case 'overcast clouds ':
        return 'assets/cloudy.json';
      case 'smoke':
        return 'assets/sunny_cloudy.json';
      case 'light rain':
      case 'moderate rain':
      case 'heavy intensity rain':
      case 'very heavy rain':
      case 'extreme rain':
      case 'light intensity drizzle':
      case 'heavy intensity drizzle':
      case 'shower rain':
      case 'heavy shower rain':
      case 'ragged shower rain':
      case 'drizzle':
        return 'assets/rainy.json';

      case 'thunderstorm with light rain':
      case 'thunderstorm with rain':
      case 'thunderstorm with heavy rain':
      case 'light thunderstorm':
      case 'thunderstorm':
      case 'heavy thunderstorm':
      case 'ragged thunderstorm':
        return 'assets/thunderstorm.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }
}
