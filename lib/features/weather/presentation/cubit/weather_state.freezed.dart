// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeatherState {
  bool get isLoading => throw _privateConstructorUsedError;
  DayForecastEntity? get selectedDayForecast =>
      throw _privateConstructorUsedError;
  WeeklyForecastEntity? get weeklyForecast =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  TemperatureUnit get temperatureUnit => throw _privateConstructorUsedError;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
  @useResult
  $Res call(
      {bool isLoading,
      DayForecastEntity? selectedDayForecast,
      WeeklyForecastEntity? weeklyForecast,
      String? errorMessage,
      TemperatureUnit temperatureUnit});

  $DayForecastEntityCopyWith<$Res>? get selectedDayForecast;
  $WeeklyForecastEntityCopyWith<$Res>? get weeklyForecast;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedDayForecast = freezed,
    Object? weeklyForecast = freezed,
    Object? errorMessage = freezed,
    Object? temperatureUnit = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDayForecast: freezed == selectedDayForecast
          ? _value.selectedDayForecast
          : selectedDayForecast // ignore: cast_nullable_to_non_nullable
              as DayForecastEntity?,
      weeklyForecast: freezed == weeklyForecast
          ? _value.weeklyForecast
          : weeklyForecast // ignore: cast_nullable_to_non_nullable
              as WeeklyForecastEntity?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      temperatureUnit: null == temperatureUnit
          ? _value.temperatureUnit
          : temperatureUnit // ignore: cast_nullable_to_non_nullable
              as TemperatureUnit,
    ) as $Val);
  }

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DayForecastEntityCopyWith<$Res>? get selectedDayForecast {
    if (_value.selectedDayForecast == null) {
      return null;
    }

    return $DayForecastEntityCopyWith<$Res>(_value.selectedDayForecast!,
        (value) {
      return _then(_value.copyWith(selectedDayForecast: value) as $Val);
    });
  }

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeeklyForecastEntityCopyWith<$Res>? get weeklyForecast {
    if (_value.weeklyForecast == null) {
      return null;
    }

    return $WeeklyForecastEntityCopyWith<$Res>(_value.weeklyForecast!, (value) {
      return _then(_value.copyWith(weeklyForecast: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherStateImplCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$WeatherStateImplCopyWith(
          _$WeatherStateImpl value, $Res Function(_$WeatherStateImpl) then) =
      __$$WeatherStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      DayForecastEntity? selectedDayForecast,
      WeeklyForecastEntity? weeklyForecast,
      String? errorMessage,
      TemperatureUnit temperatureUnit});

  @override
  $DayForecastEntityCopyWith<$Res>? get selectedDayForecast;
  @override
  $WeeklyForecastEntityCopyWith<$Res>? get weeklyForecast;
}

/// @nodoc
class __$$WeatherStateImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$WeatherStateImpl>
    implements _$$WeatherStateImplCopyWith<$Res> {
  __$$WeatherStateImplCopyWithImpl(
      _$WeatherStateImpl _value, $Res Function(_$WeatherStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedDayForecast = freezed,
    Object? weeklyForecast = freezed,
    Object? errorMessage = freezed,
    Object? temperatureUnit = null,
  }) {
    return _then(_$WeatherStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDayForecast: freezed == selectedDayForecast
          ? _value.selectedDayForecast
          : selectedDayForecast // ignore: cast_nullable_to_non_nullable
              as DayForecastEntity?,
      weeklyForecast: freezed == weeklyForecast
          ? _value.weeklyForecast
          : weeklyForecast // ignore: cast_nullable_to_non_nullable
              as WeeklyForecastEntity?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      temperatureUnit: null == temperatureUnit
          ? _value.temperatureUnit
          : temperatureUnit // ignore: cast_nullable_to_non_nullable
              as TemperatureUnit,
    ));
  }
}

/// @nodoc

class _$WeatherStateImpl implements _WeatherState {
  const _$WeatherStateImpl(
      {this.isLoading = false,
      this.selectedDayForecast,
      this.weeklyForecast,
      this.errorMessage,
      this.temperatureUnit = TemperatureUnit.celsius});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final DayForecastEntity? selectedDayForecast;
  @override
  final WeeklyForecastEntity? weeklyForecast;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final TemperatureUnit temperatureUnit;

  @override
  String toString() {
    return 'WeatherState(isLoading: $isLoading, selectedDayForecast: $selectedDayForecast, weeklyForecast: $weeklyForecast, errorMessage: $errorMessage, temperatureUnit: $temperatureUnit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedDayForecast, selectedDayForecast) ||
                other.selectedDayForecast == selectedDayForecast) &&
            (identical(other.weeklyForecast, weeklyForecast) ||
                other.weeklyForecast == weeklyForecast) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.temperatureUnit, temperatureUnit) ||
                other.temperatureUnit == temperatureUnit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, selectedDayForecast,
      weeklyForecast, errorMessage, temperatureUnit);

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      __$$WeatherStateImplCopyWithImpl<_$WeatherStateImpl>(this, _$identity);
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState(
      {final bool isLoading,
      final DayForecastEntity? selectedDayForecast,
      final WeeklyForecastEntity? weeklyForecast,
      final String? errorMessage,
      final TemperatureUnit temperatureUnit}) = _$WeatherStateImpl;

  @override
  bool get isLoading;
  @override
  DayForecastEntity? get selectedDayForecast;
  @override
  WeeklyForecastEntity? get weeklyForecast;
  @override
  String? get errorMessage;
  @override
  TemperatureUnit get temperatureUnit;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
