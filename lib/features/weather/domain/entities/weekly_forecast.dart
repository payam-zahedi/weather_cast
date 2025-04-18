import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_cast/features/weather/domain/entities/forecast.dart';

part 'weekly_forecast.freezed.dart';

@freezed
class WeeklyForecastEntity with _$WeeklyForecastEntity {
  factory WeeklyForecastEntity({
    required String cityName,
    required List<DayForecastEntity> dayForecasts,
  }) = _WeeklyForecastEntity;
}

@freezed
class DayForecastEntity with _$DayForecastEntity {
  factory DayForecastEntity({
    required DateTime date,
    required List<ForecastEntity> forecasts,
    ForecastEntity? currentForecast,
    required ForecastEntity averageForecast,
  }) = _DayForecastEntity;
}
