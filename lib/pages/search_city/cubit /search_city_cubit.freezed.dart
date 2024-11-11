// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_city_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchCityState {
  TextEditingController get controller => throw _privateConstructorUsedError;
  Weather? get weather => throw _privateConstructorUsedError;
  List<Forecast>? get forecast => throw _privateConstructorUsedError;
  SearchCityStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of SearchCityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchCityStateCopyWith<SearchCityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCityStateCopyWith<$Res> {
  factory $SearchCityStateCopyWith(
          SearchCityState value, $Res Function(SearchCityState) then) =
      _$SearchCityStateCopyWithImpl<$Res, SearchCityState>;
  @useResult
  $Res call(
      {TextEditingController controller,
      Weather? weather,
      List<Forecast>? forecast,
      SearchCityStatus status});
}

/// @nodoc
class _$SearchCityStateCopyWithImpl<$Res, $Val extends SearchCityState>
    implements $SearchCityStateCopyWith<$Res> {
  _$SearchCityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchCityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
    Object? weather = freezed,
    Object? forecast = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      forecast: freezed == forecast
          ? _value.forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as List<Forecast>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchCityStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchCityStateImplCopyWith<$Res>
    implements $SearchCityStateCopyWith<$Res> {
  factory _$$SearchCityStateImplCopyWith(_$SearchCityStateImpl value,
          $Res Function(_$SearchCityStateImpl) then) =
      __$$SearchCityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController controller,
      Weather? weather,
      List<Forecast>? forecast,
      SearchCityStatus status});
}

/// @nodoc
class __$$SearchCityStateImplCopyWithImpl<$Res>
    extends _$SearchCityStateCopyWithImpl<$Res, _$SearchCityStateImpl>
    implements _$$SearchCityStateImplCopyWith<$Res> {
  __$$SearchCityStateImplCopyWithImpl(
      _$SearchCityStateImpl _value, $Res Function(_$SearchCityStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchCityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
    Object? weather = freezed,
    Object? forecast = freezed,
    Object? status = null,
  }) {
    return _then(_$SearchCityStateImpl(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      forecast: freezed == forecast
          ? _value._forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as List<Forecast>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchCityStatus,
    ));
  }
}

/// @nodoc

class _$SearchCityStateImpl extends _SearchCityState {
  _$SearchCityStateImpl(
      {required this.controller,
      this.weather,
      final List<Forecast>? forecast,
      this.status = SearchCityStatus.initial})
      : _forecast = forecast,
        super._();

  @override
  final TextEditingController controller;
  @override
  final Weather? weather;
  final List<Forecast>? _forecast;
  @override
  List<Forecast>? get forecast {
    final value = _forecast;
    if (value == null) return null;
    if (_forecast is EqualUnmodifiableListView) return _forecast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final SearchCityStatus status;

  @override
  String toString() {
    return 'SearchCityState(controller: $controller, weather: $weather, forecast: $forecast, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchCityStateImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.weather, weather) || other.weather == weather) &&
            const DeepCollectionEquality().equals(other._forecast, _forecast) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller, weather,
      const DeepCollectionEquality().hash(_forecast), status);

  /// Create a copy of SearchCityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCityStateImplCopyWith<_$SearchCityStateImpl> get copyWith =>
      __$$SearchCityStateImplCopyWithImpl<_$SearchCityStateImpl>(
          this, _$identity);
}

abstract class _SearchCityState extends SearchCityState {
  factory _SearchCityState(
      {required final TextEditingController controller,
      final Weather? weather,
      final List<Forecast>? forecast,
      final SearchCityStatus status}) = _$SearchCityStateImpl;
  _SearchCityState._() : super._();

  @override
  TextEditingController get controller;
  @override
  Weather? get weather;
  @override
  List<Forecast>? get forecast;
  @override
  SearchCityStatus get status;

  /// Create a copy of SearchCityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchCityStateImplCopyWith<_$SearchCityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
