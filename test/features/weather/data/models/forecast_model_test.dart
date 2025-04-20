import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_cast/features/weather/data/models/forecast_model.dart';

void main() {
  late Map<String, dynamic> testJsonMap;

  setUpAll(() async {
    final file = File('test/features/weather/data/models/forecast_sample.json');
    final jsonString = await file.readAsString();
    testJsonMap = json.decode(jsonString);
  });

  group('Forecast Model', () {
    test('should parse from JSON correctly', () {
      // When
      final result = Forecast.fromJson(testJsonMap);

      // Then
      expect(result.dt, 1745182800);
      expect(result.main.temp, 284.47);
      expect(result.main.feelsLike, 283.56);
      expect(result.main.humidity, 73);
      expect(result.weather.length, 1);
      expect(result.weather.first.main, 'Clouds');
      expect(result.weather.first.description, 'overcast clouds');
      expect(result.weather.first.icon, '04n');
      expect(result.clouds.all, 89);
      expect(result.wind.speed, 2.84);
      expect(result.wind.deg, 87);
      expect(result.wind.gust, 4.15);
      expect(result.visibility, 10000);
      expect(result.pop, 0);
      expect(result.rain, isNull);
      expect(result.sys.pod, 'n');
      expect(result.dtTxt, DateTime.parse('2025-04-20 21:00:00'));
    });

    test('should handle missing rain field', () {
      // The sample doesn't have rain, so we don't need to remove it

      // When
      final result = Forecast.fromJson(testJsonMap);

      // Then
      expect(result.rain, isNull);
    });

    test('should handle rain field when present', () {
      // Given
      final jsonMapWithRain = Map<String, dynamic>.from(testJsonMap);
      jsonMapWithRain['rain'] = {'3h': 0.26};

      // When
      final result = Forecast.fromJson(jsonMapWithRain);

      // Then
      expect(result.rain, isNotNull);
      expect(result.rain?.the3H, 0.26);
    });
  });

  group('Weather Model', () {
    test('should parse from JSON correctly', () {
      // Given
      final jsonWeather = testJsonMap['weather'][0] as Map<String, dynamic>;

      // When
      final result = Weather.fromJson(jsonWeather);

      // Then
      expect(result.id, 804);
      expect(result.main, 'Clouds');
      expect(result.description, 'overcast clouds');
      expect(result.icon, '04n');
    });
  });

  group('Main Model', () {
    test('should parse from JSON correctly', () {
      // Given
      final jsonMain = testJsonMap['main'] as Map<String, dynamic>;

      // When
      final result = Main.fromJson(jsonMain);

      // Then
      expect(result.temp, 284.47);
      expect(result.feelsLike, 283.56);
      expect(result.tempMin, 284.36);
      expect(result.tempMax, 284.47);
      expect(result.pressure, 1007);
      expect(result.seaLevel, 1007);
      expect(result.grndLevel, 1003);
      expect(result.humidity, 73);
      expect(result.tempKf, 0.11);
    });
  });
}
