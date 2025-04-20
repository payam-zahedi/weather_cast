import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_cast/core/constants/api_constants.dart';
import 'package:weather_cast/core/errors/exceptions.dart';
import 'package:weather_cast/core/network/api_client.dart';
import 'package:weather_cast/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_cast/features/weather/data/models/forecast_result_model.dart';

import 'weather_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late WeatherRemoteDataSourceImpl dataSource;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = WeatherRemoteDataSourceImpl(client: mockApiClient);
  });

  const testCityName = 'London';
  const testApiResponse = '''
  {
    "cod": "200",
    "message": 0,
    "cnt": 40,
    "list": [
      {
        "dt": 1661871600,
        "main": {
          "temp": 296.76,
          "feels_like": 296.98,
          "temp_min": 296.76,
          "temp_max": 297.87,
          "pressure": 1015,
          "sea_level": 1015,
          "grnd_level": 933,
          "humidity": 69,
          "temp_kf": -1.11
        },
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10d"
          }
        ],
        "clouds": {
          "all": 100
        },
        "wind": {
          "speed": 0.62,
          "deg": 349,
          "gust": 1.18
        },
        "visibility": 10000,
        "pop": 0.32,
        "rain": {
          "3h": 0.26
        },
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-08-30 15:00:00"
      }
    ],
    "city": {
      "id": 3163858,
      "name": "London",
      "coord": {
        "lat": 44.34,
        "lon": 10.99
      },
      "country": "GB",
      "population": 4593,
      "timezone": 7200,
      "sunrise": 1661834187,
      "sunset": 1661882248
    }
  }
  ''';

  group('getWeatherWeeklyForecast', () {
    test('should call get method from ApiClient with correct parameters',
        () async {
      when(mockApiClient.get(
        ApiConstants.forecastEndpoint,
        queryParameters: {
          ApiConstants.cityNameParam: testCityName,
          ApiConstants.apiKeyParam: ApiConstants.apiKey,
        },
      )).thenAnswer((_) async => json.decode(testApiResponse));

      final result = await dataSource.getWeatherWeeklyForecast(testCityName);

      verify(mockApiClient.get(
        ApiConstants.forecastEndpoint,
        queryParameters: {
          ApiConstants.cityNameParam: testCityName,
          ApiConstants.apiKeyParam: ApiConstants.apiKey,
        },
      ));

      expect(result, isA<ForecastResult>());
    });

    test('should return ForecastResult when the API call is successful',
        () async {
      // Arrange
      when(mockApiClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => json.decode(testApiResponse));

      // Act
      final result = await dataSource.getWeatherWeeklyForecast(testCityName);

      // Assert
      expect(result, isA<ForecastResult>());
      expect(result.city.name, 'London');
      expect(result.list.length, 1);
      expect(result.list.first.weather.first.main, 'Rain');
    });

    test('should throw a ServerException when the API call fails', () async {
      // Arrange
      when(mockApiClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(ServerException(message: 'Server error', statusCode: 500));

      // Act & Assert
      expect(
        () => dataSource.getWeatherWeeklyForecast(testCityName),
        throwsA(isA<ServerException>()),
      );
    });

    test('should propagate the ServerException when the API call fails',
        () async {
      // Arrange
      const errorMessage = 'Server error';
      const statusCode = 404;
      when(mockApiClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(
          ServerException(message: errorMessage, statusCode: statusCode));

      // Act
      try {
        await dataSource.getWeatherWeeklyForecast(testCityName);
        fail('Should have thrown a ServerException');
      } catch (e) {
        // Assert
        expect(e, isA<ServerException>());
        final exception = e as ServerException;
        expect(exception.message, errorMessage);
        expect(exception.statusCode, statusCode);
      }
    });
  });
}
