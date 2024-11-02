part of 'home_page_cubit.dart';

enum HomePageStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
class HomePageState with _$HomePageState {
  const HomePageState._();

  factory HomePageState({
    required TextEditingController controller,
    Weather? weather,
    List<Forecast>? weekForecast,
    @Default(HomePageStatus.initial) HomePageStatus status,
  }) = _HomePageState;
}
