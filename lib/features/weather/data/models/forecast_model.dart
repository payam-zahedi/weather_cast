import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_model.freezed.dart';
part 'forecast_model.g.dart';

/// Forecast is a model that represents a forecast from the OpenWeather API.
@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    required int dt,
    required List<Weather> weather,
    required Main main,
    required Clouds clouds,
    required Wind wind,
    required int visibility,
    required int pop,
    required Sys sys,
    required DateTime dtTxt,
    required Rain? rain,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}

@freezed
class Clouds with _$Clouds {
  const factory Clouds({
    required int all,
  }) = _Clouds;

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@freezed
class Rain with _$Rain {
  const factory Rain({
    @JsonKey(name: '3h') required double the3H,
  }) = _Rain;

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
}

@freezed
class Main with _$Main {
  const factory Main({
    required double temp,
    required double feelsLike,
    required double tempMin,
    required double tempMax,
    required int pressure,
    required int seaLevel,
    required int grndLevel,
    required int humidity,
    required double tempKf,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
class Sys with _$Sys {
  const factory Sys({
    required String pod,
  }) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@freezed
class Weather with _$Weather {
  const factory Weather({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
class Wind with _$Wind {
  const factory Wind({
    required double speed,
    required int deg,
    required double gust,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
