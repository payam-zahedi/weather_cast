import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_cast/features/weather/domain/entities/weekly_forecast.dart';

part 'weather_state.freezed.dart';

enum TemperatureUnit {
  celsius(sign: '°C'),
  fahrenheit(sign: '°F');

  const TemperatureUnit({required this.sign});
  final String sign;
}

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(false) bool isLoading,
    DayForecastEntity? selectedDayForecast,
    WeeklyForecastEntity? weeklyForecast,
    String? errorMessage,
    @Default(TemperatureUnit.celsius) TemperatureUnit temperatureUnit,
  }) = _WeatherState;
}
