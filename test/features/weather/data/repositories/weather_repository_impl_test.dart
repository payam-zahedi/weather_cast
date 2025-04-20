import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_cast/core/errors/exceptions.dart';
import 'package:weather_cast/core/errors/failures.dart';
import 'package:weather_cast/core/network/network_info.dart';
import 'package:weather_cast/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_cast/features/weather/data/models/forecast_result_model.dart';
import 'package:weather_cast/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_cast/features/weather/domain/entities/weather_forecast.dart';

import 'weather_repository_impl_test.mocks.dart';

@GenerateMocks([WeatherRemoteDataSource, NetworkInfo])
void main() {
  late WeatherRepositoryImpl repository;
  late MockWeatherRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockWeatherRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = WeatherRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const testCityName = 'London';

  final testForecastResult = ForecastResult.fromJson({
    "cod": "200",
    "message": 0,
    "cnt": 1,
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
        "clouds": {"all": 100},
        "wind": {"speed": 0.62, "deg": 349, "gust": 1.18},
        "visibility": 10000,
        "pop": 0.32,
        "rain": {"3h": 0.26},
        "sys": {"pod": "d"},
        "dt_txt": "2022-08-30 15:00:00"
      }
    ],
    "city": {
      "id": 3163858,
      "name": "London",
      "coord": {"lat": 44.34, "lon": 10.99},
      "country": "GB",
      "population": 4593,
      "timezone": 7200,
      "sunrise": 1661834187,
      "sunset": 1661882248
    }
  });

  group('getWeatherForecast', () {
    test(
      'should check if device is online before making API call',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.getWeatherWeeklyForecast(any))
            .thenAnswer((_) async => testForecastResult);

        // Act
        await repository.getWeatherForecast(testCityName);

        // Assert - verify isConnected was checked first
        verify(mockNetworkInfo.isConnected);
      },
    );

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return weather forecast when the remote data source call is successful',
        () async {
          // Arrange
          when(mockRemoteDataSource.getWeatherWeeklyForecast(any))
              .thenAnswer((_) async => testForecastResult);

          // Act
          final result = await repository.getWeatherForecast(testCityName);

          // Assert
          verify(mockRemoteDataSource.getWeatherWeeklyForecast(testCityName));
          expect(result, isA<Right<Failure, WeatherForecastEntity>>());

          // Unwrap the result to check the entity
          result.fold(
            (failure) => fail('Expected Right to be returned'),
            (forecast) {
              expect(forecast, isA<WeatherForecastEntity>());
              expect(forecast.cityName, equals('London'));
              expect(forecast.forecasts.length, equals(1));
            },
          );
        },
      );

      test(
        'should handle empty city name gracefully',
        () async {
          // Arrange
          const emptyCityName = '';
          when(mockRemoteDataSource.getWeatherWeeklyForecast(emptyCityName))
              .thenAnswer((_) async => throw Exception('Test error'));

          // Act
          final result = await repository.getWeatherForecast(emptyCityName);

          // Assert
          verify(mockRemoteDataSource.getWeatherWeeklyForecast(emptyCityName));
          expect(result, isA<Left<Failure, WeatherForecastEntity>>());

          result.fold(
            (failure) {
              expect(failure, isA<ServerFailure>());
              expect((failure as ServerFailure).statusCode, equals(500));
              expect(failure.message, contains('Test error'));
            },
            (_) => fail('Expected Left to be returned'),
          );
        },
      );
      test(
        'should return server failure when the remote data source call throws a ServerException',
        () async {
          // Arrange
          const errorMessage = 'Server error';
          const statusCode = 500;
          when(mockRemoteDataSource.getWeatherWeeklyForecast(any)).thenThrow(
              const ServerException(
                  message: errorMessage, statusCode: statusCode));

          // Act
          final result = await repository.getWeatherForecast(testCityName);

          // Assert
          verify(mockRemoteDataSource.getWeatherWeeklyForecast(testCityName));
          expect(result, isA<Left<Failure, WeatherForecastEntity>>());
          expect(
            result,
            equals(
              const Left<Failure, WeatherForecastEntity>(
                ServerFailure(message: errorMessage, statusCode: statusCode),
              ),
            ),
          );
        },
      );

      test(
        'should return server failure with 404 status code when city is not found',
        () async {
          // Arrange
          const errorMessage = 'City not found';
          const statusCode = 404;
          when(mockRemoteDataSource.getWeatherWeeklyForecast(any)).thenThrow(
              const ServerException(
                  message: errorMessage, statusCode: statusCode));

          // Act
          final result = await repository.getWeatherForecast('NonExistentCity');

          // Assert
          verify(
              mockRemoteDataSource.getWeatherWeeklyForecast('NonExistentCity'));
          expect(result, isA<Left<Failure, WeatherForecastEntity>>());

          result.fold(
            (failure) {
              expect(failure, isA<ServerFailure>());
              expect((failure as ServerFailure).statusCode, equals(404));
              expect(failure.message, contains('City not found'));
            },
            (_) => fail('Expected Left to be returned'),
          );
        },
      );

      test(
        'should return server failure when the remote data source call throws FormatException',
        () async {
          // Arrange
          const errorMessage = 'Invalid JSON format';
          when(mockRemoteDataSource.getWeatherWeeklyForecast(any))
              .thenThrow(const FormatException(errorMessage));

          // Act
          final result = await repository.getWeatherForecast(testCityName);

          // Assert
          verify(mockRemoteDataSource.getWeatherWeeklyForecast(testCityName));
          expect(result, isA<Left<Failure, WeatherForecastEntity>>());

          result.fold(
            (failure) {
              expect(failure, isA<ServerFailure>());
              expect((failure as ServerFailure).message,
                  contains('Invalid JSON format'));
              expect(failure.statusCode, equals(500));
            },
            (_) => fail('Expected Left to be returned'),
          );
        },
      );
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
        'should return NetworkFailure when the device is offline',
        () async {
          // Act
          final result = await repository.getWeatherForecast(testCityName);

          // Assert
          verifyZeroInteractions(mockRemoteDataSource);
          expect(result, isA<Left<Failure, WeatherForecastEntity>>());

          result.fold(
            (failure) {
              expect(failure, isA<NetworkFailure>());
              expect((failure as NetworkFailure).message,
                  'No internet connection');
            },
            (_) => fail('Expected Left to be returned'),
          );
        },
      );
    });
  });
}
