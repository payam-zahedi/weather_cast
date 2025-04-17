import 'package:dartz/dartz.dart';
import 'package:weather_cast/core/errors/failures.dart';
import 'package:weather_cast/features/weather/domain/entities/weather_forecast.dart';
import 'package:weather_cast/features/weather/domain/repositories/weather_repository.dart';

class GetWeatherForecast {
  final WeatherRepository repository;

  GetWeatherForecast(this.repository);

  Future<Either<Failure, WeatherForecast>> execute(String cityName) {
    return repository.getWeatherForecast(cityName);
  }
}
