// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomePageState {
  TextEditingController get controller => throw _privateConstructorUsedError;
  Weather? get weather => throw _privateConstructorUsedError;
  List<Forecast>? get weekForecast => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;
  HomePageStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {TextEditingController controller,
      Weather? weather,
      List<Forecast>? weekForecast,
      Error? error,
      HomePageStatus status});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
    Object? weather = freezed,
    Object? weekForecast = freezed,
    Object? error = freezed,
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
      weekForecast: freezed == weekForecast
          ? _value.weekForecast
          : weekForecast // ignore: cast_nullable_to_non_nullable
              as List<Forecast>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomePageStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePageStateImplCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$HomePageStateImplCopyWith(
          _$HomePageStateImpl value, $Res Function(_$HomePageStateImpl) then) =
      __$$HomePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController controller,
      Weather? weather,
      List<Forecast>? weekForecast,
      Error? error,
      HomePageStatus status});
}

/// @nodoc
class __$$HomePageStateImplCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$HomePageStateImpl>
    implements _$$HomePageStateImplCopyWith<$Res> {
  __$$HomePageStateImplCopyWithImpl(
      _$HomePageStateImpl _value, $Res Function(_$HomePageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
    Object? weather = freezed,
    Object? weekForecast = freezed,
    Object? error = freezed,
    Object? status = null,
  }) {
    return _then(_$HomePageStateImpl(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      weekForecast: freezed == weekForecast
          ? _value._weekForecast
          : weekForecast // ignore: cast_nullable_to_non_nullable
              as List<Forecast>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomePageStatus,
    ));
  }
}

/// @nodoc

class _$HomePageStateImpl extends _HomePageState {
  _$HomePageStateImpl(
      {required this.controller,
      this.weather,
      final List<Forecast>? weekForecast,
      this.error,
      this.status = HomePageStatus.initial})
      : _weekForecast = weekForecast,
        super._();

  @override
  final TextEditingController controller;
  @override
  final Weather? weather;
  final List<Forecast>? _weekForecast;
  @override
  List<Forecast>? get weekForecast {
    final value = _weekForecast;
    if (value == null) return null;
    if (_weekForecast is EqualUnmodifiableListView) return _weekForecast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Error? error;
  @override
  @JsonKey()
  final HomePageStatus status;

  @override
  String toString() {
    return 'HomePageState(controller: $controller, weather: $weather, weekForecast: $weekForecast, error: $error, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageStateImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.weather, weather) || other.weather == weather) &&
            const DeepCollectionEquality()
                .equals(other._weekForecast, _weekForecast) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller, weather,
      const DeepCollectionEquality().hash(_weekForecast), error, status);

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      __$$HomePageStateImplCopyWithImpl<_$HomePageStateImpl>(this, _$identity);
}

abstract class _HomePageState extends HomePageState {
  factory _HomePageState(
      {required final TextEditingController controller,
      final Weather? weather,
      final List<Forecast>? weekForecast,
      final Error? error,
      final HomePageStatus status}) = _$HomePageStateImpl;
  _HomePageState._() : super._();

  @override
  TextEditingController get controller;
  @override
  Weather? get weather;
  @override
  List<Forecast>? get weekForecast;
  @override
  Error? get error;
  @override
  HomePageStatus get status;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
