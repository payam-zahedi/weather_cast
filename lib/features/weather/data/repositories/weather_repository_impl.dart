import 'package:dartz/dartz.dart';
import 'package:weather_cast/features/weather/domain/entities/weather_forecast.dart';
import 'package:weather_cast/core/errors/exceptions.dart';
import 'package:weather_cast/core/errors/failures.dart';
import 'package:weather_cast/core/network/network_info.dart';
import 'package:weather_cast/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_cast/features/weather/data/datasources/weather_remote_data_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  // TODO: add support for offline mode later
  @override
  Future<Either<Failure, WeatherForecastEntity>> getWeatherForecast(
    String cityName,
  ) async {
    try {
      final forecastResult = await remoteDataSource.getWeatherWeeklyForecast(
        cityName,
      );

      // Convert ForecastResult to WeatherForecast using the mapper
      return Right(forecastResult.toWeatherForecast());
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString(), statusCode: 500),
      );
    }
  }
}
