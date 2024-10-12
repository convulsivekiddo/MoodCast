part of 'app_cubit.dart';

enum AppStatus { initial, loading, success, error }

@freezed
class AppState with _$AppState {
  const AppState._();
  // get blueTheme => ThemeData(
  //       primaryColor: Constants.primaryColorBlue,
  //       scaffoldBackgroundColor: Constants.scaffoldBackgroundBlue,
  //       textTheme: const TextTheme(
  //         headlineLarge: TextStyle(
  //           fontSize: 48.0,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.white,
  //         ),
  //         headlineMedium: TextStyle(
  //           fontSize: 24,
  //           color: Colors.white,
  //         ),
  //         bodyLarge: TextStyle(
  //           fontSize: 18,
  //           color: Colors.white70,
  //         ),
  //         bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
  //       ),
  //       iconTheme: IconThemeData(
  //         color: Colors.white,
  //         size: 48,
  //       ),
  //     );
  //
  // get orangeTheme => ThemeData(
  //       primaryColor: Constants.primaryColorOrange,
  //       scaffoldBackgroundColor: Constants.scaffoldBackgroundOrange,
  //       textTheme: const TextTheme(
  //         headlineLarge: TextStyle(
  //           fontSize: 48.0,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.white,
  //         ),
  //         headlineMedium: TextStyle(
  //           fontSize: 24,
  //           color: Colors.white,
  //         ),
  //         bodyLarge: TextStyle(
  //           fontSize: 18,
  //           color: Colors.white70,
  //         ),
  //         bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
  //       ),
  //       iconTheme: IconThemeData(
  //         color: Colors.white,
  //         size: 48,
  //       ),
  //     );

  const factory AppState({
    // @Default(ThemeData(appBarTheme: Colors.orange ))
    // @Default(ThemeData) ThemeData currentTheme,
    // @Default(Colors.lightBlue) MaterialColor currentThemeColor,
    // @Default(false) bool isInit,
    // @Default(AppTheme.blueTheme) ThemeData currentTheme,
    @Default(false) bool isLogin,
    @Default(true) bool isBlueTheme,
    @Default(0) int currentDay,
  }) = _AppState;
}
