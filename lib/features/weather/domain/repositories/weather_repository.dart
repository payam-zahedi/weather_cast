import 'package:dartz/dartz.dart';
import 'package:weather_cast/core/errors/failures.dart';
import 'package:weather_cast/features/weather/domain/entities/weather_forecast.dart';

abstract class WeatherRepository {
  /// Get weather forecast for the next few days for a city
  Future<Either<Failure, WeatherForecastEntity>> getWeatherForecast(
      String cityName);
}
