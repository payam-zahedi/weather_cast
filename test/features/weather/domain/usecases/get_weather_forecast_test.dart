import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_cast/core/errors/failures.dart';
import 'package:weather_cast/features/weather/domain/entities/weather_forecast.dart';
import 'package:weather_cast/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_cast/features/weather/domain/usecases/get_weather_forecast.dart';

import 'get_weather_forecast_test.mocks.dart';

@GenerateMocks([WeatherRepository])
void main() {
  late GetWeatherForecastUseCase usecase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    usecase = GetWeatherForecastUseCase(mockWeatherRepository);
  });

  const String tCityName = 'London';
  final tWeatherForecast =
      WeatherForecastEntity(cityName: tCityName, forecasts: {});

  test('should get weather forecast from the repository', () async {
    // arrange
    when(mockWeatherRepository.getWeatherForecast(any))
        .thenAnswer((_) async => Right(tWeatherForecast));

    // act
    final result = await usecase.execute(tCityName);

    // assert
    expect(result, Right(tWeatherForecast));
    verify(mockWeatherRepository.getWeatherForecast(tCityName));
    verifyNoMoreInteractions(mockWeatherRepository);
  });

  test('should relay server failure from the repository', () async {
    // arrange
    final failure = const ServerFailure(message: 'Server error');
    when(mockWeatherRepository.getWeatherForecast(any))
        .thenAnswer((_) async => Left(failure));

    // act
    final result = await usecase.execute(tCityName);

    // assert
    expect(result, Left(failure));
    var foldedResult = result.fold((l) => l, (r) => r);
    expect(foldedResult, failure);

    expect(foldedResult, isA<ServerFailure>());
    // verify
    verify(mockWeatherRepository.getWeatherForecast(tCityName));
    verifyNoMoreInteractions(mockWeatherRepository);
  });
}
