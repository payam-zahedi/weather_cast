// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeeklyForecastEntity {
  String get cityName => throw _privateConstructorUsedError;
  List<DayForecastEntity> get dayForecasts =>
      throw _privateConstructorUsedError;

  /// Create a copy of WeeklyForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyForecastEntityCopyWith<WeeklyForecastEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyForecastEntityCopyWith<$Res> {
  factory $WeeklyForecastEntityCopyWith(WeeklyForecastEntity value,
          $Res Function(WeeklyForecastEntity) then) =
      _$WeeklyForecastEntityCopyWithImpl<$Res, WeeklyForecastEntity>;
  @useResult
  $Res call({String cityName, List<DayForecastEntity> dayForecasts});
}

/// @nodoc
class _$WeeklyForecastEntityCopyWithImpl<$Res,
        $Val extends WeeklyForecastEntity>
    implements $WeeklyForecastEntityCopyWith<$Res> {
  _$WeeklyForecastEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? dayForecasts = null,
  }) {
    return _then(_value.copyWith(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      dayForecasts: null == dayForecasts
          ? _value.dayForecasts
          : dayForecasts // ignore: cast_nullable_to_non_nullable
              as List<DayForecastEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyForecastEntityImplCopyWith<$Res>
    implements $WeeklyForecastEntityCopyWith<$Res> {
  factory _$$WeeklyForecastEntityImplCopyWith(_$WeeklyForecastEntityImpl value,
          $Res Function(_$WeeklyForecastEntityImpl) then) =
      __$$WeeklyForecastEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cityName, List<DayForecastEntity> dayForecasts});
}

/// @nodoc
class __$$WeeklyForecastEntityImplCopyWithImpl<$Res>
    extends _$WeeklyForecastEntityCopyWithImpl<$Res, _$WeeklyForecastEntityImpl>
    implements _$$WeeklyForecastEntityImplCopyWith<$Res> {
  __$$WeeklyForecastEntityImplCopyWithImpl(_$WeeklyForecastEntityImpl _value,
      $Res Function(_$WeeklyForecastEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? dayForecasts = null,
  }) {
    return _then(_$WeeklyForecastEntityImpl(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      dayForecasts: null == dayForecasts
          ? _value._dayForecasts
          : dayForecasts // ignore: cast_nullable_to_non_nullable
              as List<DayForecastEntity>,
    ));
  }
}

/// @nodoc

class _$WeeklyForecastEntityImpl implements _WeeklyForecastEntity {
  _$WeeklyForecastEntityImpl(
      {required this.cityName,
      required final List<DayForecastEntity> dayForecasts})
      : _dayForecasts = dayForecasts;

  @override
  final String cityName;
  final List<DayForecastEntity> _dayForecasts;
  @override
  List<DayForecastEntity> get dayForecasts {
    if (_dayForecasts is EqualUnmodifiableListView) return _dayForecasts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dayForecasts);
  }

  @override
  String toString() {
    return 'WeeklyForecastEntity(cityName: $cityName, dayForecasts: $dayForecasts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyForecastEntityImpl &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            const DeepCollectionEquality()
                .equals(other._dayForecasts, _dayForecasts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cityName,
      const DeepCollectionEquality().hash(_dayForecasts));

  /// Create a copy of WeeklyForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyForecastEntityImplCopyWith<_$WeeklyForecastEntityImpl>
      get copyWith =>
          __$$WeeklyForecastEntityImplCopyWithImpl<_$WeeklyForecastEntityImpl>(
              this, _$identity);
}

abstract class _WeeklyForecastEntity implements WeeklyForecastEntity {
  factory _WeeklyForecastEntity(
          {required final String cityName,
          required final List<DayForecastEntity> dayForecasts}) =
      _$WeeklyForecastEntityImpl;

  @override
  String get cityName;
  @override
  List<DayForecastEntity> get dayForecasts;

  /// Create a copy of WeeklyForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyForecastEntityImplCopyWith<_$WeeklyForecastEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DayForecastEntity {
  DateTime get date => throw _privateConstructorUsedError;
  List<ForecastEntity> get forecasts => throw _privateConstructorUsedError;
  ForecastEntity? get currentForecast => throw _privateConstructorUsedError;
  ForecastEntity get averageForecast => throw _privateConstructorUsedError;

  /// Create a copy of DayForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayForecastEntityCopyWith<DayForecastEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayForecastEntityCopyWith<$Res> {
  factory $DayForecastEntityCopyWith(
          DayForecastEntity value, $Res Function(DayForecastEntity) then) =
      _$DayForecastEntityCopyWithImpl<$Res, DayForecastEntity>;
  @useResult
  $Res call(
      {DateTime date,
      List<ForecastEntity> forecasts,
      ForecastEntity? currentForecast,
      ForecastEntity averageForecast});

  $ForecastEntityCopyWith<$Res>? get currentForecast;
  $ForecastEntityCopyWith<$Res> get averageForecast;
}

/// @nodoc
class _$DayForecastEntityCopyWithImpl<$Res, $Val extends DayForecastEntity>
    implements $DayForecastEntityCopyWith<$Res> {
  _$DayForecastEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? forecasts = null,
    Object? currentForecast = freezed,
    Object? averageForecast = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      forecasts: null == forecasts
          ? _value.forecasts
          : forecasts // ignore: cast_nullable_to_non_nullable
              as List<ForecastEntity>,
      currentForecast: freezed == currentForecast
          ? _value.currentForecast
          : currentForecast // ignore: cast_nullable_to_non_nullable
              as ForecastEntity?,
      averageForecast: null == averageForecast
          ? _value.averageForecast
          : averageForecast // ignore: cast_nullable_to_non_nullable
              as ForecastEntity,
    ) as $Val);
  }

  /// Create a copy of DayForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ForecastEntityCopyWith<$Res>? get currentForecast {
    if (_value.currentForecast == null) {
      return null;
    }

    return $ForecastEntityCopyWith<$Res>(_value.currentForecast!, (value) {
      return _then(_value.copyWith(currentForecast: value) as $Val);
    });
  }

  /// Create a copy of DayForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ForecastEntityCopyWith<$Res> get averageForecast {
    return $ForecastEntityCopyWith<$Res>(_value.averageForecast, (value) {
      return _then(_value.copyWith(averageForecast: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DayForecastEntityImplCopyWith<$Res>
    implements $DayForecastEntityCopyWith<$Res> {
  factory _$$DayForecastEntityImplCopyWith(_$DayForecastEntityImpl value,
          $Res Function(_$DayForecastEntityImpl) then) =
      __$$DayForecastEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      List<ForecastEntity> forecasts,
      ForecastEntity? currentForecast,
      ForecastEntity averageForecast});

  @override
  $ForecastEntityCopyWith<$Res>? get currentForecast;
  @override
  $ForecastEntityCopyWith<$Res> get averageForecast;
}

/// @nodoc
class __$$DayForecastEntityImplCopyWithImpl<$Res>
    extends _$DayForecastEntityCopyWithImpl<$Res, _$DayForecastEntityImpl>
    implements _$$DayForecastEntityImplCopyWith<$Res> {
  __$$DayForecastEntityImplCopyWithImpl(_$DayForecastEntityImpl _value,
      $Res Function(_$DayForecastEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DayForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? forecasts = null,
    Object? currentForecast = freezed,
    Object? averageForecast = null,
  }) {
    return _then(_$DayForecastEntityImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      forecasts: null == forecasts
          ? _value._forecasts
          : forecasts // ignore: cast_nullable_to_non_nullable
              as List<ForecastEntity>,
      currentForecast: freezed == currentForecast
          ? _value.currentForecast
          : currentForecast // ignore: cast_nullable_to_non_nullable
              as ForecastEntity?,
      averageForecast: null == averageForecast
          ? _value.averageForecast
          : averageForecast // ignore: cast_nullable_to_non_nullable
              as ForecastEntity,
    ));
  }
}

/// @nodoc

class _$DayForecastEntityImpl implements _DayForecastEntity {
  _$DayForecastEntityImpl(
      {required this.date,
      required final List<ForecastEntity> forecasts,
      this.currentForecast,
      required this.averageForecast})
      : _forecasts = forecasts;

  @override
  final DateTime date;
  final List<ForecastEntity> _forecasts;
  @override
  List<ForecastEntity> get forecasts {
    if (_forecasts is EqualUnmodifiableListView) return _forecasts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forecasts);
  }

  @override
  final ForecastEntity? currentForecast;
  @override
  final ForecastEntity averageForecast;

  @override
  String toString() {
    return 'DayForecastEntity(date: $date, forecasts: $forecasts, currentForecast: $currentForecast, averageForecast: $averageForecast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayForecastEntityImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._forecasts, _forecasts) &&
            (identical(other.currentForecast, currentForecast) ||
                other.currentForecast == currentForecast) &&
            (identical(other.averageForecast, averageForecast) ||
                other.averageForecast == averageForecast));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      const DeepCollectionEquality().hash(_forecasts),
      currentForecast,
      averageForecast);

  /// Create a copy of DayForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayForecastEntityImplCopyWith<_$DayForecastEntityImpl> get copyWith =>
      __$$DayForecastEntityImplCopyWithImpl<_$DayForecastEntityImpl>(
          this, _$identity);
}

abstract class _DayForecastEntity implements DayForecastEntity {
  factory _DayForecastEntity(
      {required final DateTime date,
      required final List<ForecastEntity> forecasts,
      final ForecastEntity? currentForecast,
      required final ForecastEntity averageForecast}) = _$DayForecastEntityImpl;

  @override
  DateTime get date;
  @override
  List<ForecastEntity> get forecasts;
  @override
  ForecastEntity? get currentForecast;
  @override
  ForecastEntity get averageForecast;

  /// Create a copy of DayForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayForecastEntityImplCopyWith<_$DayForecastEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
