part of 'app_cubit.dart';

enum AppStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
class AppState with _$AppState {
  const AppState._();

  const factory AppState({
    @Default(false) bool isLogin,
    @Default(true) bool isBlueTheme,
    @Default(0) int currentDay,
  }) = _AppState;
}
