import 'package:dartz/dartz.dart';
import 'package:weather_cast/features/weather/data/mappers/forecast_mapper.dart';
import 'package:weather_cast/features/weather/domain/entities/weather_forecast.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_local_data_source.dart';
import '../datasources/weather_remote_data_source.dart';
import '../models/forecast_result_model.dart';

// TODO:
// 1. The Forecast model in forecast_model.dart needs to be updated to include a 'main' field of type Main
// 2. After updating the model, run 'flutter pub run build_runner build --delete-conflicting-outputs'
//    to regenerate the Freezed models

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  // TODO: add support for offline mode later
  @override
  Future<Either<Failure, WeatherForecast>> getWeatherForecast(
    String cityName,
  ) async {
    try {
      final forecastResult = await remoteDataSource.getWeatherWeeklyForecast(
        cityName,
      );

      // TODO: Cache the forecast for offline use
      // await localDataSource.cacheWeather(forecastResult);

      // Convert ForecastResult to WeatherForecast using the mapper
      return Right(ForecastMapper.toWeatherForecast(forecastResult));
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
