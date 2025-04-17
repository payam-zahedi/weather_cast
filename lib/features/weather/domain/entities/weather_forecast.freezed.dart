// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeatherForecast {
  String get cityName => throw _privateConstructorUsedError;
  Map<DateTime, DayForecast> get dayForecasts =>
      throw _privateConstructorUsedError;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherForecastCopyWith<WeatherForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastCopyWith<$Res> {
  factory $WeatherForecastCopyWith(
          WeatherForecast value, $Res Function(WeatherForecast) then) =
      _$WeatherForecastCopyWithImpl<$Res, WeatherForecast>;
  @useResult
  $Res call({String cityName, Map<DateTime, DayForecast> dayForecasts});
}

/// @nodoc
class _$WeatherForecastCopyWithImpl<$Res, $Val extends WeatherForecast>
    implements $WeatherForecastCopyWith<$Res> {
  _$WeatherForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherForecast
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
              as Map<DateTime, DayForecast>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherForecastImplCopyWith<$Res>
    implements $WeatherForecastCopyWith<$Res> {
  factory _$$WeatherForecastImplCopyWith(_$WeatherForecastImpl value,
          $Res Function(_$WeatherForecastImpl) then) =
      __$$WeatherForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cityName, Map<DateTime, DayForecast> dayForecasts});
}

/// @nodoc
class __$$WeatherForecastImplCopyWithImpl<$Res>
    extends _$WeatherForecastCopyWithImpl<$Res, _$WeatherForecastImpl>
    implements _$$WeatherForecastImplCopyWith<$Res> {
  __$$WeatherForecastImplCopyWithImpl(
      _$WeatherForecastImpl _value, $Res Function(_$WeatherForecastImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? dayForecasts = null,
  }) {
    return _then(_$WeatherForecastImpl(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      dayForecasts: null == dayForecasts
          ? _value._dayForecasts
          : dayForecasts // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, DayForecast>,
    ));
  }
}

/// @nodoc

class _$WeatherForecastImpl implements _WeatherForecast {
  _$WeatherForecastImpl(
      {required this.cityName,
      required final Map<DateTime, DayForecast> dayForecasts})
      : _dayForecasts = dayForecasts;

  @override
  final String cityName;
  final Map<DateTime, DayForecast> _dayForecasts;
  @override
  Map<DateTime, DayForecast> get dayForecasts {
    if (_dayForecasts is EqualUnmodifiableMapView) return _dayForecasts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dayForecasts);
  }

  @override
  String toString() {
    return 'WeatherForecast(cityName: $cityName, dayForecasts: $dayForecasts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherForecastImpl &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            const DeepCollectionEquality()
                .equals(other._dayForecasts, _dayForecasts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cityName,
      const DeepCollectionEquality().hash(_dayForecasts));

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherForecastImplCopyWith<_$WeatherForecastImpl> get copyWith =>
      __$$WeatherForecastImplCopyWithImpl<_$WeatherForecastImpl>(
          this, _$identity);
}

abstract class _WeatherForecast implements WeatherForecast {
  factory _WeatherForecast(
          {required final String cityName,
          required final Map<DateTime, DayForecast> dayForecasts}) =
      _$WeatherForecastImpl;

  @override
  String get cityName;
  @override
  Map<DateTime, DayForecast> get dayForecasts;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherForecastImplCopyWith<_$WeatherForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DayForecast {
  String get weatherStatus => throw _privateConstructorUsedError;
  String get weatherDescription => throw _privateConstructorUsedError;
  String get weatherIcon => throw _privateConstructorUsedError;
  ForecastSpecs? get currentForecast => throw _privateConstructorUsedError;
  ForecastSpecs get averageForecast => throw _privateConstructorUsedError;

  /// Create a copy of DayForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayForecastCopyWith<DayForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayForecastCopyWith<$Res> {
  factory $DayForecastCopyWith(
          DayForecast value, $Res Function(DayForecast) then) =
      _$DayForecastCopyWithImpl<$Res, DayForecast>;
  @useResult
  $Res call(
      {String weatherStatus,
      String weatherDescription,
      String weatherIcon,
      ForecastSpecs? currentForecast,
      ForecastSpecs averageForecast});

  $ForecastSpecsCopyWith<$Res>? get currentForecast;
  $ForecastSpecsCopyWith<$Res> get averageForecast;
}

/// @nodoc
class _$DayForecastCopyWithImpl<$Res, $Val extends DayForecast>
    implements $DayForecastCopyWith<$Res> {
  _$DayForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherStatus = null,
    Object? weatherDescription = null,
    Object? weatherIcon = null,
    Object? currentForecast = freezed,
    Object? averageForecast = null,
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
      currentForecast: freezed == currentForecast
          ? _value.currentForecast
          : currentForecast // ignore: cast_nullable_to_non_nullable
              as ForecastSpecs?,
      averageForecast: null == averageForecast
          ? _value.averageForecast
          : averageForecast // ignore: cast_nullable_to_non_nullable
              as ForecastSpecs,
    ) as $Val);
  }

  /// Create a copy of DayForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ForecastSpecsCopyWith<$Res>? get currentForecast {
    if (_value.currentForecast == null) {
      return null;
    }

    return $ForecastSpecsCopyWith<$Res>(_value.currentForecast!, (value) {
      return _then(_value.copyWith(currentForecast: value) as $Val);
    });
  }

  /// Create a copy of DayForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ForecastSpecsCopyWith<$Res> get averageForecast {
    return $ForecastSpecsCopyWith<$Res>(_value.averageForecast, (value) {
      return _then(_value.copyWith(averageForecast: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DayForecastImplCopyWith<$Res>
    implements $DayForecastCopyWith<$Res> {
  factory _$$DayForecastImplCopyWith(
          _$DayForecastImpl value, $Res Function(_$DayForecastImpl) then) =
      __$$DayForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String weatherStatus,
      String weatherDescription,
      String weatherIcon,
      ForecastSpecs? currentForecast,
      ForecastSpecs averageForecast});

  @override
  $ForecastSpecsCopyWith<$Res>? get currentForecast;
  @override
  $ForecastSpecsCopyWith<$Res> get averageForecast;
}

/// @nodoc
class __$$DayForecastImplCopyWithImpl<$Res>
    extends _$DayForecastCopyWithImpl<$Res, _$DayForecastImpl>
    implements _$$DayForecastImplCopyWith<$Res> {
  __$$DayForecastImplCopyWithImpl(
      _$DayForecastImpl _value, $Res Function(_$DayForecastImpl) _then)
      : super(_value, _then);

  /// Create a copy of DayForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherStatus = null,
    Object? weatherDescription = null,
    Object? weatherIcon = null,
    Object? currentForecast = freezed,
    Object? averageForecast = null,
  }) {
    return _then(_$DayForecastImpl(
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
      currentForecast: freezed == currentForecast
          ? _value.currentForecast
          : currentForecast // ignore: cast_nullable_to_non_nullable
              as ForecastSpecs?,
      averageForecast: null == averageForecast
          ? _value.averageForecast
          : averageForecast // ignore: cast_nullable_to_non_nullable
              as ForecastSpecs,
    ));
  }
}

/// @nodoc

class _$DayForecastImpl implements _DayForecast {
  _$DayForecastImpl(
      {required this.weatherStatus,
      required this.weatherDescription,
      required this.weatherIcon,
      this.currentForecast,
      required this.averageForecast});

  @override
  final String weatherStatus;
  @override
  final String weatherDescription;
  @override
  final String weatherIcon;
  @override
  final ForecastSpecs? currentForecast;
  @override
  final ForecastSpecs averageForecast;

  @override
  String toString() {
    return 'DayForecast(weatherStatus: $weatherStatus, weatherDescription: $weatherDescription, weatherIcon: $weatherIcon, currentForecast: $currentForecast, averageForecast: $averageForecast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayForecastImpl &&
            (identical(other.weatherStatus, weatherStatus) ||
                other.weatherStatus == weatherStatus) &&
            (identical(other.weatherDescription, weatherDescription) ||
                other.weatherDescription == weatherDescription) &&
            (identical(other.weatherIcon, weatherIcon) ||
                other.weatherIcon == weatherIcon) &&
            (identical(other.currentForecast, currentForecast) ||
                other.currentForecast == currentForecast) &&
            (identical(other.averageForecast, averageForecast) ||
                other.averageForecast == averageForecast));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weatherStatus,
      weatherDescription, weatherIcon, currentForecast, averageForecast);

  /// Create a copy of DayForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayForecastImplCopyWith<_$DayForecastImpl> get copyWith =>
      __$$DayForecastImplCopyWithImpl<_$DayForecastImpl>(this, _$identity);
}

abstract class _DayForecast implements DayForecast {
  factory _DayForecast(
      {required final String weatherStatus,
      required final String weatherDescription,
      required final String weatherIcon,
      final ForecastSpecs? currentForecast,
      required final ForecastSpecs averageForecast}) = _$DayForecastImpl;

  @override
  String get weatherStatus;
  @override
  String get weatherDescription;
  @override
  String get weatherIcon;
  @override
  ForecastSpecs? get currentForecast;
  @override
  ForecastSpecs get averageForecast;

  /// Create a copy of DayForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayForecastImplCopyWith<_$DayForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForecastSpecs {
  double get temperature => throw _privateConstructorUsedError;
  double get feelsLike => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  double get pressure => throw _privateConstructorUsedError;
  double get windSpeed => throw _privateConstructorUsedError;

  /// Create a copy of ForecastSpecs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForecastSpecsCopyWith<ForecastSpecs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastSpecsCopyWith<$Res> {
  factory $ForecastSpecsCopyWith(
          ForecastSpecs value, $Res Function(ForecastSpecs) then) =
      _$ForecastSpecsCopyWithImpl<$Res, ForecastSpecs>;
  @useResult
  $Res call(
      {double temperature,
      double feelsLike,
      int humidity,
      double pressure,
      double windSpeed});
}

/// @nodoc
class _$ForecastSpecsCopyWithImpl<$Res, $Val extends ForecastSpecs>
    implements $ForecastSpecsCopyWith<$Res> {
  _$ForecastSpecsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForecastSpecs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? feelsLike = null,
    Object? humidity = null,
    Object? pressure = null,
    Object? windSpeed = null,
  }) {
    return _then(_value.copyWith(
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
              as double,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForecastSpecsImplCopyWith<$Res>
    implements $ForecastSpecsCopyWith<$Res> {
  factory _$$ForecastSpecsImplCopyWith(
          _$ForecastSpecsImpl value, $Res Function(_$ForecastSpecsImpl) then) =
      __$$ForecastSpecsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double temperature,
      double feelsLike,
      int humidity,
      double pressure,
      double windSpeed});
}

/// @nodoc
class __$$ForecastSpecsImplCopyWithImpl<$Res>
    extends _$ForecastSpecsCopyWithImpl<$Res, _$ForecastSpecsImpl>
    implements _$$ForecastSpecsImplCopyWith<$Res> {
  __$$ForecastSpecsImplCopyWithImpl(
      _$ForecastSpecsImpl _value, $Res Function(_$ForecastSpecsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForecastSpecs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? feelsLike = null,
    Object? humidity = null,
    Object? pressure = null,
    Object? windSpeed = null,
  }) {
    return _then(_$ForecastSpecsImpl(
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
              as double,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ForecastSpecsImpl implements _ForecastSpecs {
  _$ForecastSpecsImpl(
      {required this.temperature,
      required this.feelsLike,
      required this.humidity,
      required this.pressure,
      required this.windSpeed});

  @override
  final double temperature;
  @override
  final double feelsLike;
  @override
  final int humidity;
  @override
  final double pressure;
  @override
  final double windSpeed;

  @override
  String toString() {
    return 'ForecastSpecs(temperature: $temperature, feelsLike: $feelsLike, humidity: $humidity, pressure: $pressure, windSpeed: $windSpeed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastSpecsImpl &&
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
      runtimeType, temperature, feelsLike, humidity, pressure, windSpeed);

  /// Create a copy of ForecastSpecs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastSpecsImplCopyWith<_$ForecastSpecsImpl> get copyWith =>
      __$$ForecastSpecsImplCopyWithImpl<_$ForecastSpecsImpl>(this, _$identity);
}

abstract class _ForecastSpecs implements ForecastSpecs {
  factory _ForecastSpecs(
      {required final double temperature,
      required final double feelsLike,
      required final int humidity,
      required final double pressure,
      required final double windSpeed}) = _$ForecastSpecsImpl;

  @override
  double get temperature;
  @override
  double get feelsLike;
  @override
  int get humidity;
  @override
  double get pressure;
  @override
  double get windSpeed;

  /// Create a copy of ForecastSpecs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForecastSpecsImplCopyWith<_$ForecastSpecsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
