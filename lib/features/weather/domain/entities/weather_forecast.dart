import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_cast/features/weather/domain/entities/forecast.dart';

part 'weather_forecast.freezed.dart';

@freezed
class WeatherForecastEntity with _$WeatherForecastEntity {
  factory WeatherForecastEntity({
    required String cityName,
    required Map<DateTime, List<ForecastEntity>> forecasts,
  }) = _WeatherForecastEntity;
}
