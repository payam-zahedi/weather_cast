import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_cast/features/weather/data/models/forecast_result_model.dart';
import 'package:weather_cast/features/weather/domain/entities/weather_forecast.dart';

void main() {
  late Map<String, dynamic> testJsonMap;
  late ForecastResult forecastResult;

  setUpAll(() async {
    final file =
        File('test/features/weather/data/models/forecast_result_sample.json');
    final jsonString = await file.readAsString();
    testJsonMap = json.decode(jsonString);
    forecastResult = ForecastResult.fromJson(testJsonMap);
  });

  group('ForecastResult', () {
    test('should parse from JSON correctly', () {
      // Then
      expect(forecastResult.cod, "200");
      expect(forecastResult.message, 0);
      expect(forecastResult.cnt, 10);
      expect(forecastResult.list.length, 10);
      expect(forecastResult.city.name, "London");
      expect(forecastResult.city.coord.lat, 51.5085);
      expect(forecastResult.city.coord.lon, -0.1257);
    });

    test('should parse weather details correctly', () {
      final forecast = forecastResult.list.first;

      expect(forecast.dt, 1745182800);
      expect(forecast.main.temp, 284.47);
      expect(forecast.main.humidity, 73);
      expect(forecast.weather.first.main, "Clouds");
      expect(forecast.weather.first.description, "overcast clouds");
      expect(forecast.weather.first.icon, "04n");
      expect(forecast.wind.speed, 2.84);
    });

    test('should convert to WeatherForecastEntity correctly', () {
      // When
      final entity = forecastResult.toWeatherForecast();

      // Then
      expect(entity, isA<WeatherForecastEntity>());
      expect(entity.cityName, "London");

      // The forecasts are grouped by day
      expect(entity.forecasts.length, 3); // 3 different days in the sample

      // Check April 20 forecasts
      final april20 = DateTime(2025, 4, 20);
      expect(entity.forecasts.containsKey(april20), isTrue);

      // Check April 21 forecasts
      final april21 = DateTime(2025, 4, 21);
      expect(entity.forecasts.containsKey(april21), isTrue);

      // Check April 22 forecasts
      final april22 = DateTime(2025, 4, 22);
      expect(entity.forecasts.containsKey(april22), isTrue);

      // Check details of first forecast on April 21
      final april21Forecasts = entity.forecasts[april21]!;
      expect(april21Forecasts.isNotEmpty, isTrue);

      final firstForecast = april21Forecasts.first;
      expect(firstForecast.weatherStatus, "Clouds");
      expect(firstForecast.weatherDescription, "overcast clouds");
      expect(firstForecast.temperature, 283.65);
      expect(firstForecast.humidity, 80);
    });
  });
}
