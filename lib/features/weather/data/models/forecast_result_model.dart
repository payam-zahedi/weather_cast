import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather_cast/features/weather/data/models/forecast_model.dart';
import 'package:weather_cast/features/weather/domain/entities/forecast.dart';
import 'package:weather_cast/features/weather/domain/entities/weather_forecast.dart';

part 'forecast_result_model.freezed.dart';
part 'forecast_result_model.g.dart';

/// ForecastResult is a model that represents the result of a forecast request.
/// It contains the city name, the list of forecasts, and the city information.
/// It also contains a method to convert the forecast result to a [WeatherForecastEntity].
@freezed
class ForecastResult with _$ForecastResult {
  const ForecastResult._();

  const factory ForecastResult({
    required String cod,
    required int message,
    required int cnt,
    required List<Forecast> list,
    required City city,
  }) = _ForecastResult;

  factory ForecastResult.fromJson(Map<String, dynamic> json) =>
      _$ForecastResultFromJson(json);

  WeatherForecastEntity toWeatherForecast() {
    final Map<DateTime, List<ForecastEntity>> forecastsByDay = {};

    for (final forecast in list) {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000);
      final day = DateTime(dateTime.year, dateTime.month, dateTime.day);

      forecastsByDay.putIfAbsent(day, () => []).add(
            ForecastEntity(
              weatherStatus: forecast.weather.first.main,
              weatherDescription: forecast.weather.first.description,
              weatherIcon: forecast.weather.first.icon,
              temperature: forecast.main.temp,
              feelsLike: forecast.main.feelsLike,
              humidity: forecast.main.humidity,
              pressure: forecast.main.pressure,
              windSpeed: forecast.wind.speed,
            ),
          );
    }

    return WeatherForecastEntity(
      cityName: city.name,
      forecasts: forecastsByDay,
    );
  }
}

@freezed
class City with _$City {
  const factory City({
    required int id,
    required String name,
    required Coord coord,
    required String country,
    required int population,
    required int timezone,
    required int sunrise,
    required int sunset,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@freezed
class Coord with _$Coord {
  const factory Coord({
    required double lat,
    required double lon,
  }) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}
