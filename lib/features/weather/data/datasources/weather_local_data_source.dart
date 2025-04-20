import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_cast/core/constants/app_constants.dart';
import 'package:weather_cast/core/errors/exceptions.dart';
import 'package:weather_cast/features/weather/data/models/forecast_result_model.dart';

abstract class WeatherLocalDataSource {
  /// Gets the cached Weather forecast.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<ForecastResult> getLastWeather();

  /// Cache the Weather forecast.
  Future<void> cacheWeather(ForecastResult forecastToCache);
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<ForecastResult> getLastWeather() async {
    final jsonString = sharedPreferences.getString(AppConstants.lastWeatherKey);
    if (jsonString != null) {
      return ForecastResult.fromJson(json.decode(jsonString));
    } else {
      throw const CacheException(message: 'No cached weather found');
    }
  }

  @override
  Future<void> cacheWeather(ForecastResult forecastToCache) async {
    await sharedPreferences.setString(
      AppConstants.lastWeatherKey,
      json.encode(forecastToCache.toJson()),
    );
  }
}
