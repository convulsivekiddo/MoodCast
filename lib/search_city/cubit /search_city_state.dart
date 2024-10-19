part of 'search_city_cubit.dart';

enum SearchCityStatus { initial, loading, success, error }

@freezed
class SearchCityState with _$SearchCityState {
  const SearchCityState._();

  factory SearchCityState({
    required TextEditingController controller,
    Weather? weather,
    List<Forecast>? forecast,
    Error? error,
    @Default(SearchCityStatus.initial) SearchCityStatus status,
  }) = _SearchCityState;
}
