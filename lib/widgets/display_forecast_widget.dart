// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:spring/spring.dart';
// import 'package:weather_prediction/app_cubit/app_cubit.dart';
// import '../models/daily_forecast.dart';
// import '../theme /theme.dart';
//
// class ForecastWidget extends StatelessWidget {
//   final List<DailyForecast>? forecastList;
//
//   const ForecastWidget({super.key, required this.forecastList});
//
//   @override
//   Widget build(BuildContext context) {
//     return Spring.fadeIn(
//       animDuration: const Duration(milliseconds: 500),
//       child: Column(
//         children: [
//           Text(
//             '7-DAY WEATHER FORECAST',
//             style: AppTheme.createWhiteTextStyle(16),
//           ),
//           const SizedBox(height: 10),
//           SizedBox(
//             height: 120,
//             width: 300,
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               separatorBuilder: (context, index) => const SizedBox(width: 5),
//               itemCount: forecastList?.length ?? 0,
//               itemBuilder: (context, index) {
//                 final dailyForecast = forecastList![index];
//
//                 // Extracting day of the week and formatting temperature
//                 String dayOfWeek =
//                     DateFormat('EEEE').format(dailyForecast.date);
//                 String maxTemp =
//                     '${dailyForecast.temperatureMax.toStringAsFixed(1)}°C';
//                 String minTemp =
//                     '${dailyForecast.temperatureMin.toStringAsFixed(1)}°C';
//
//                 // Use a method to map the main condition to an icon
//                 IconData weatherIcon =
//                     _mapWeatherToIcon(dailyForecast.mainCondition);
//
//                 return _createItemList(
//                     dayOfWeek, maxTemp, minTemp, weatherIcon);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Container _createItemList(
//     String dayOfWeek,
//     String maxTemp,
//     String minTemp,
//     IconData weatherIcon,
//   ) {
//     return Container(
//       height: 50,
//       width: 170,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             dayOfWeek,
//             style: AppTheme.createWhiteTextStyle(16),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 maxTemp,
//                 style: AppTheme.createWhiteTextStyle(14),
//               ),
//               const SizedBox(width: 5.0),
//               Icon(weatherIcon, size: 16, color: Colors.black),
//               const SizedBox(width: 5.0),
//               Text(
//                 minTemp,
//                 style: AppTheme.createWhiteTextStyle(14),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   IconData _mapWeatherToIcon(String condition) {
//     // Map condition to icons
//     switch (condition.toLowerCase()) {
//       case 'clear':
//         return Icons.wb_sunny; // Replace with appropriate icon
//       case 'rain':
//         return Icons.beach_access; // Replace with appropriate icon
//       case 'clouds':
//         return Icons.cloud; // Replace with appropriate icon
//       // Add more conditions as needed
//       default:
//         return Icons.help_outline; // Fallback icon
//     }
//   }
// }
