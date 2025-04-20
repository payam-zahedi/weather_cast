import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_cast/features/weather/domain/entities/forecast.dart';
import 'package:weather_cast/features/weather/domain/entities/weather_forecast.dart';
import 'package:weather_cast/features/weather/domain/entities/weekly_forecast.dart';
import 'package:weather_cast/features/weather/domain/usecases/aggregate_weekly_forecast.dart';
import 'package:weather_cast/features/weather/domain/usecases/get_weather_forecast.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather_cast/core/errors/failures.dart';

import 'weather_cubit_test.mocks.dart';

@GenerateMocks([GetWeatherForecastUseCase, AggregateWeeklyForecastUseCase])
void main() {
  late WeatherCubit weatherCubit;
  late MockGetWeatherForecastUseCase mockGetWeatherForecastUseCase;
  late MockAggregateWeeklyForecastUseCase mockAggregateWeeklyForecastUseCase;

  setUp(() {
    mockGetWeatherForecastUseCase = MockGetWeatherForecastUseCase();
    mockAggregateWeeklyForecastUseCase = MockAggregateWeeklyForecastUseCase();
    weatherCubit = WeatherCubit(
      getWeatherForecastUseCase: mockGetWeatherForecastUseCase,
      aggregateWeeklyForecastUseCase: mockAggregateWeeklyForecastUseCase,
    );
  });

  tearDown(() {
    weatherCubit.close();
  });

  test('initial state should be correct', () {
    // Verify initial state
    expect(weatherCubit.state.isLoading, false);
    expect(weatherCubit.state.selectedDayForecast, null);
    expect(weatherCubit.state.weeklyForecast, null);
    expect(weatherCubit.state.errorMessage, null);
    expect(weatherCubit.state.temperatureUnit, TemperatureUnit.celsius);
  });

  group('fetchWeatherForecast', () {
    final now = DateTime.now();

    final averageForecast = ForecastEntity(
      weatherStatus: 'Clear',
      weatherDescription: 'Clear sky',
      weatherIcon: '01d',
      temperature: 15.0,
      feelsLike: 14.0,
      humidity: 75,
      pressure: 1012,
      windSpeed: 5.5,
    );

    final forecast1 = ForecastEntity(
      weatherStatus: 'Clear',
      weatherDescription: 'Clear sky',
      weatherIcon: '01d',
      temperature: 15.0,
      feelsLike: 14.0,
      humidity: 75,
      pressure: 1012,
      windSpeed: 5.5,
    );

    final forecast2 = ForecastEntity(
      weatherStatus: 'Clouds',
      weatherDescription: 'Scattered clouds',
      weatherIcon: '03d',
      temperature: 18.0,
      feelsLike: 17.5,
      humidity: 70,
      pressure: 1010,
      windSpeed: 4.0,
    );

    final dayForecast1 = DayForecastEntity(
      date: now,
      forecasts: [forecast1, forecast2],
      averageForecast: averageForecast,
    );

    final dayForecast2 = DayForecastEntity(
      date: now.add(const Duration(days: 1)),
      forecasts: [forecast1, forecast2],
      averageForecast: averageForecast,
    );

    final weatherForecast = WeatherForecastEntity(
      cityName: 'Berlin',
      forecasts: {
        now: [forecast1, forecast2],
        now.add(const Duration(days: 1)): [forecast1, forecast2],
      },
    );

    final weeklyForecast = WeeklyForecastEntity(
      cityName: 'Berlin',
      dayForecasts: [dayForecast1, dayForecast2],
    );

    test(
        'should emit loading state and then success state with weekly forecast',
        () async {
      // Arrange
      when(mockGetWeatherForecastUseCase.execute('Berlin'))
          .thenAnswer((_) async => Right(weatherForecast));
      when(mockAggregateWeeklyForecastUseCase.execute(weatherForecast))
          .thenAnswer((_) => Right(weeklyForecast));

      // Act
      await weatherCubit.fetchWeatherForecast();

      // Assert
      verify(mockGetWeatherForecastUseCase.execute('Berlin'));
      verify(mockAggregateWeeklyForecastUseCase.execute(weatherForecast));

      expect(weatherCubit.state.isLoading, false);
      expect(weatherCubit.state.selectedDayForecast, dayForecast1);
      expect(weatherCubit.state.weeklyForecast, weeklyForecast);
      expect(weatherCubit.state.errorMessage, null);
    });

    test(
        'should emit loading state and then error state when get forecast usecase fails',
        () async {
      // Arrange
      final tFailure = const ServerFailure(message: 'Server error');
      when(mockGetWeatherForecastUseCase.execute('Berlin'))
          .thenAnswer((_) async => Left(tFailure));

      // Act
      await weatherCubit.fetchWeatherForecast();

      // Assert
      verify(mockGetWeatherForecastUseCase.execute('Berlin'));
      verifyZeroInteractions(mockAggregateWeeklyForecastUseCase);

      expect(weatherCubit.state.isLoading, false);
      expect(weatherCubit.state.selectedDayForecast, null);
      expect(weatherCubit.state.weeklyForecast, null);
      expect(weatherCubit.state.errorMessage, 'Server error');
    });

    test(
        'should emit loading state and then error state when aggregate usecase fails',
        () async {
      // Arrange
      final tFailure = const ServerFailure(message: 'Processing error');
      when(mockGetWeatherForecastUseCase.execute('Berlin'))
          .thenAnswer((_) async => Right(weatherForecast));
      when(mockAggregateWeeklyForecastUseCase.execute(weatherForecast))
          .thenAnswer((_) => Left(tFailure));

      // Act
      await weatherCubit.fetchWeatherForecast();

      // Assert
      verify(mockGetWeatherForecastUseCase.execute('Berlin'));
      verify(mockAggregateWeeklyForecastUseCase.execute(weatherForecast));

      expect(weatherCubit.state.isLoading, false);
      expect(weatherCubit.state.selectedDayForecast, null);
      expect(weatherCubit.state.weeklyForecast, null);
      expect(weatherCubit.state.errorMessage, 'Processing error');
    });

    test('should use the provided city name when specified', () async {
      // Arrange
      when(mockGetWeatherForecastUseCase.execute('London'))
          .thenAnswer((_) async => Right(weatherForecast));
      when(mockAggregateWeeklyForecastUseCase.execute(weatherForecast))
          .thenAnswer((_) => Right(weeklyForecast));

      // Act
      await weatherCubit.fetchWeatherForecast(cityName: 'London');

      // Assert
      verify(mockGetWeatherForecastUseCase.execute('London'));
    });
  });

  group('selectDayForecast', () {
    test('should update selectedDayForecast when weeklyForecast is not null',
        () {
      // Arrange
      final averageForecast = ForecastEntity(
        weatherStatus: 'Clear',
        weatherDescription: 'Clear sky',
        weatherIcon: '01d',
        temperature: 15.0,
        feelsLike: 14.0,
        humidity: 75,
        pressure: 1012,
        windSpeed: 5.5,
      );

      final dayForecast1 = DayForecastEntity(
        date: DateTime.now(),
        forecasts: [],
        averageForecast: averageForecast,
      );

      final dayForecast2 = DayForecastEntity(
        date: DateTime.now().add(const Duration(days: 1)),
        forecasts: [],
        averageForecast: averageForecast,
      );

      final weeklyForecast = WeeklyForecastEntity(
        cityName: 'Berlin',
        dayForecasts: [dayForecast1, dayForecast2],
      );

      // Set initial state with weekly forecast data
      weatherCubit.emit(WeatherState(
        weeklyForecast: weeklyForecast,
        selectedDayForecast: dayForecast1,
      ));

      // Act
      weatherCubit.selectDayForecast(dayForecast2);

      // Assert
      expect(weatherCubit.state.selectedDayForecast, dayForecast2);
    });

    test('should not update selectedDayForecast when weeklyForecast is null',
        () {
      // Arrange
      final averageForecast = ForecastEntity(
        weatherStatus: 'Clear',
        weatherDescription: 'Clear sky',
        weatherIcon: '01d',
        temperature: 15.0,
        feelsLike: 14.0,
        humidity: 75,
        pressure: 1012,
        windSpeed: 5.5,
      );

      final dayForecast = DayForecastEntity(
        date: DateTime.now(),
        forecasts: [],
        averageForecast: averageForecast,
      );

      // Act
      weatherCubit.selectDayForecast(dayForecast);

      // Assert
      expect(weatherCubit.state.selectedDayForecast, null);
    });
  });

  group('toggleTemperatureUnit', () {
    test('should toggle from celsius to fahrenheit', () {
      // Act
      weatherCubit.toggleTemperatureUnit();

      // Assert
      expect(weatherCubit.state.temperatureUnit, TemperatureUnit.fahrenheit);
    });

    test('should toggle from fahrenheit to celsius', () {
      // Arrange - set initial state to fahrenheit
      weatherCubit.emit(const WeatherState(
        temperatureUnit: TemperatureUnit.fahrenheit,
      ));

      // Act
      weatherCubit.toggleTemperatureUnit();

      // Assert
      expect(weatherCubit.state.temperatureUnit, TemperatureUnit.celsius);
    });
  });
}
