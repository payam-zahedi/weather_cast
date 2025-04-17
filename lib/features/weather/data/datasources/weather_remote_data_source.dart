import 'package:weather_cast/core/errors/exceptions.dart';
import 'package:weather_cast/core/network/api_client.dart';
import 'package:weather_cast/core/constants/api_constants.dart';
import 'package:weather_cast/features/weather/data/models/forecast_result_model.dart';

abstract class WeatherRemoteDataSource {
  /// Calls the OpenWeatherMap 5-day forecast API.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<ForecastResult> getWeatherWeeklyForecast(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final ApiClient client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<ForecastResult> getWeatherWeeklyForecast(String cityName) async {
    try {
      final response = await client.get(
        ApiConstants.forecastEndpoint,
        queryParameters: {
          ApiConstants.cityNameParam: cityName,
          // TODO: try to use interceptors to add api key
          ApiConstants.apiKeyParam: ApiConstants.apiKey,
        },
      );

      return ForecastResult.fromJson(response);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
