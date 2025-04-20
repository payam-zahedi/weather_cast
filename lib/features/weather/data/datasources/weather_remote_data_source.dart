import 'dart:developer';

import 'package:weather_cast/core/errors/exceptions.dart';
import 'package:weather_cast/core/network/api_client.dart';
import 'package:weather_cast/core/constants/api_constants.dart';
import 'package:weather_cast/features/weather/data/models/forecast_result_model.dart';

abstract class WeatherRemoteDataSource {
  const WeatherRemoteDataSource();

  /// Calls the OpenWeatherMap 5-day forecast API.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<ForecastResult> getWeatherWeeklyForecast(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  const WeatherRemoteDataSourceImpl({required this.client});

  final ApiClient client;
  @override
  Future<ForecastResult> getWeatherWeeklyForecast(String cityName) async {
    try {
      final response = await client.get(
        ApiConstants.forecastEndpoint,
        queryParameters: {
          ApiConstants.cityNameParam: cityName,
          ApiConstants.apiKeyParam: ApiConstants.apiKey,
        },
      );

      return ForecastResult.fromJson(response);
    } on ServerException catch (e, s) {
      log('ServerException: $e');
      log('Stack trace: $s');
      rethrow;
    } catch (e, s) {
      log('Error: $e');
      log('Stack trace: $s');
      throw ServerException(message: e.toString());
    }
  }
}
