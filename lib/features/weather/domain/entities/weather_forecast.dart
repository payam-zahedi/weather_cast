import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_forecast.freezed.dart';

@freezed
class WeatherForecast with _$WeatherForecast {
  factory WeatherForecast({
    required String cityName,
    required Map<DateTime, DayForecast> dayForecasts,
  }) = _WeatherForecast;
}

@freezed
class DayForecast with _$DayForecast {
  factory DayForecast({
    required String weatherStatus,
    required String weatherDescription,
    required String weatherIcon,
    ForecastSpecs? currentForecast,
    required ForecastSpecs averageForecast,
  }) = _DayForecast;
}

@freezed
class ForecastSpecs with _$ForecastSpecs {
  factory ForecastSpecs({
    required double temperature,
    required double feelsLike,
    required int humidity,
    required double pressure,
    required double windSpeed,
  }) = _ForecastSpecs;
}
