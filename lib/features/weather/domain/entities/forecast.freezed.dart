// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForecastEntity {
  String get weatherStatus => throw _privateConstructorUsedError;
  String get weatherDescription => throw _privateConstructorUsedError;
  String get weatherIcon => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  double get feelsLike => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  int get pressure => throw _privateConstructorUsedError;
  double get windSpeed => throw _privateConstructorUsedError;

  /// Create a copy of ForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForecastEntityCopyWith<ForecastEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastEntityCopyWith<$Res> {
  factory $ForecastEntityCopyWith(
          ForecastEntity value, $Res Function(ForecastEntity) then) =
      _$ForecastEntityCopyWithImpl<$Res, ForecastEntity>;
  @useResult
  $Res call(
      {String weatherStatus,
      String weatherDescription,
      String weatherIcon,
      double temperature,
      double feelsLike,
      int humidity,
      int pressure,
      double windSpeed});
}

/// @nodoc
class _$ForecastEntityCopyWithImpl<$Res, $Val extends ForecastEntity>
    implements $ForecastEntityCopyWith<$Res> {
  _$ForecastEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherStatus = null,
    Object? weatherDescription = null,
    Object? weatherIcon = null,
    Object? temperature = null,
    Object? feelsLike = null,
    Object? humidity = null,
    Object? pressure = null,
    Object? windSpeed = null,
  }) {
    return _then(_value.copyWith(
      weatherStatus: null == weatherStatus
          ? _value.weatherStatus
          : weatherStatus // ignore: cast_nullable_to_non_nullable
              as String,
      weatherDescription: null == weatherDescription
          ? _value.weatherDescription
          : weatherDescription // ignore: cast_nullable_to_non_nullable
              as String,
      weatherIcon: null == weatherIcon
          ? _value.weatherIcon
          : weatherIcon // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForecastEntityImplCopyWith<$Res>
    implements $ForecastEntityCopyWith<$Res> {
  factory _$$ForecastEntityImplCopyWith(_$ForecastEntityImpl value,
          $Res Function(_$ForecastEntityImpl) then) =
      __$$ForecastEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String weatherStatus,
      String weatherDescription,
      String weatherIcon,
      double temperature,
      double feelsLike,
      int humidity,
      int pressure,
      double windSpeed});
}

/// @nodoc
class __$$ForecastEntityImplCopyWithImpl<$Res>
    extends _$ForecastEntityCopyWithImpl<$Res, _$ForecastEntityImpl>
    implements _$$ForecastEntityImplCopyWith<$Res> {
  __$$ForecastEntityImplCopyWithImpl(
      _$ForecastEntityImpl _value, $Res Function(_$ForecastEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherStatus = null,
    Object? weatherDescription = null,
    Object? weatherIcon = null,
    Object? temperature = null,
    Object? feelsLike = null,
    Object? humidity = null,
    Object? pressure = null,
    Object? windSpeed = null,
  }) {
    return _then(_$ForecastEntityImpl(
      weatherStatus: null == weatherStatus
          ? _value.weatherStatus
          : weatherStatus // ignore: cast_nullable_to_non_nullable
              as String,
      weatherDescription: null == weatherDescription
          ? _value.weatherDescription
          : weatherDescription // ignore: cast_nullable_to_non_nullable
              as String,
      weatherIcon: null == weatherIcon
          ? _value.weatherIcon
          : weatherIcon // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ForecastEntityImpl implements _ForecastEntity {
  _$ForecastEntityImpl(
      {required this.weatherStatus,
      required this.weatherDescription,
      required this.weatherIcon,
      required this.temperature,
      required this.feelsLike,
      required this.humidity,
      required this.pressure,
      required this.windSpeed});

  @override
  final String weatherStatus;
  @override
  final String weatherDescription;
  @override
  final String weatherIcon;
  @override
  final double temperature;
  @override
  final double feelsLike;
  @override
  final int humidity;
  @override
  final int pressure;
  @override
  final double windSpeed;

  @override
  String toString() {
    return 'ForecastEntity(weatherStatus: $weatherStatus, weatherDescription: $weatherDescription, weatherIcon: $weatherIcon, temperature: $temperature, feelsLike: $feelsLike, humidity: $humidity, pressure: $pressure, windSpeed: $windSpeed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastEntityImpl &&
            (identical(other.weatherStatus, weatherStatus) ||
                other.weatherStatus == weatherStatus) &&
            (identical(other.weatherDescription, weatherDescription) ||
                other.weatherDescription == weatherDescription) &&
            (identical(other.weatherIcon, weatherIcon) ||
                other.weatherIcon == weatherIcon) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      weatherStatus,
      weatherDescription,
      weatherIcon,
      temperature,
      feelsLike,
      humidity,
      pressure,
      windSpeed);

  /// Create a copy of ForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastEntityImplCopyWith<_$ForecastEntityImpl> get copyWith =>
      __$$ForecastEntityImplCopyWithImpl<_$ForecastEntityImpl>(
          this, _$identity);
}

abstract class _ForecastEntity implements ForecastEntity {
  factory _ForecastEntity(
      {required final String weatherStatus,
      required final String weatherDescription,
      required final String weatherIcon,
      required final double temperature,
      required final double feelsLike,
      required final int humidity,
      required final int pressure,
      required final double windSpeed}) = _$ForecastEntityImpl;

  @override
  String get weatherStatus;
  @override
  String get weatherDescription;
  @override
  String get weatherIcon;
  @override
  double get temperature;
  @override
  double get feelsLike;
  @override
  int get humidity;
  @override
  int get pressure;
  @override
  double get windSpeed;

  /// Create a copy of ForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForecastEntityImplCopyWith<_$ForecastEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
