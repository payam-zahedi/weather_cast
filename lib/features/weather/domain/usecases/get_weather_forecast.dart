import 'package:dartz/dartz.dart';
import 'package:weather_cast/core/errors/failures.dart';
import 'package:weather_cast/features/weather/domain/entities/weather_forecast.dart';
import 'package:weather_cast/features/weather/domain/repositories/weather_repository.dart';

/// GetWeatherForecastUseCase is responsible for fetching weather forecast data for a specified city.
///
/// The class encapsulates the logic for retrieving weather forecast data while handling potential
/// failures through the Either type from the dartz package, providing a predictable error handling pattern.
class GetWeatherForecastUseCase {
  const GetWeatherForecastUseCase(this.repository);

  final WeatherRepository repository;

  /// Fetches weather forecast data for the specified city.
  ///
  /// Takes a [cityName] parameter representing the city for which to retrieve the forecast.
  ///
  /// Returns an [Either] containing either:
  /// - [Failure] on the left side if the operation fails with details about what went wrong
  /// - [WeatherForecastEntity] on the right side if successful, containing the forecast data
  Future<Either<Failure, WeatherForecastEntity>> execute(String cityName) {
    return repository.getWeatherForecast(cityName);
  }
}
