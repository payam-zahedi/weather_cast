import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
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

import 'weather_cubit_bloc_test.mocks.dart';

@GenerateMocks([GetWeatherForecastUseCase, AggregateWeeklyForecastUseCase])
void main() {
  late MockGetWeatherForecastUseCase mockGetWeatherForecastUseCase;
  late MockAggregateWeeklyForecastUseCase mockAggregateWeeklyForecastUseCase;
  late WeatherCubit weatherCubit;

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

  // Test data setup
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

  group('WeatherCubit', () {
    group('fetchWeatherForecast', () {
      blocTest<WeatherCubit, WeatherState>(
        'emits [loading, loaded] states when operation succeeds',
        build: () => weatherCubit,
        setUp: () {
          when(mockGetWeatherForecastUseCase.execute(any))
              .thenAnswer((_) async => Right(weatherForecast));
          when(mockAggregateWeeklyForecastUseCase.execute(any))
              .thenAnswer((_) => Right(weeklyForecast));
        },
        act: (cubit) => cubit.fetchWeatherForecast(),
        expect: () => [
          const WeatherState(isLoading: true),
          WeatherState(
            isLoading: false,
            selectedDayForecast: dayForecast1,
            weeklyForecast: weeklyForecast,
          ),
        ],
        verify: (_) {
          verify(mockGetWeatherForecastUseCase.execute('Berlin')).called(1);
          verify(mockAggregateWeeklyForecastUseCase.execute(weatherForecast))
              .called(1);
        },
      );

      blocTest<WeatherCubit, WeatherState>(
        'emits [loading, error] states when get forecast fails',
        build: () => weatherCubit,
        setUp: () {
          when(mockGetWeatherForecastUseCase.execute(any)).thenAnswer(
              (_) async => const Left(ServerFailure(message: 'Server error')));
        },
        act: (cubit) => cubit.fetchWeatherForecast(),
        expect: () => [
          const WeatherState(isLoading: true),
          const WeatherState(
            isLoading: false,
            errorMessage: 'Server error',
          ),
        ],
        verify: (_) {
          verify(mockGetWeatherForecastUseCase.execute('Berlin')).called(1);
          verifyZeroInteractions(mockAggregateWeeklyForecastUseCase);
        },
      );

      blocTest<WeatherCubit, WeatherState>(
        'emits [loading, error] states when aggregate forecast fails',
        build: () => weatherCubit,
        setUp: () {
          when(mockGetWeatherForecastUseCase.execute(any))
              .thenAnswer((_) async => Right(weatherForecast));
          when(mockAggregateWeeklyForecastUseCase.execute(any)).thenAnswer(
              (_) => const Left(ServerFailure(message: 'Processing error')));
        },
        act: (cubit) => cubit.fetchWeatherForecast(),
        expect: () => [
          const WeatherState(isLoading: true),
          const WeatherState(
            isLoading: false,
            errorMessage: 'Processing error',
          ),
        ],
        verify: (_) {
          verify(mockGetWeatherForecastUseCase.execute('Berlin')).called(1);
          verify(mockAggregateWeeklyForecastUseCase.execute(weatherForecast))
              .called(1);
        },
      );
    });

    group('selectDayForecast', () {
      blocTest<WeatherCubit, WeatherState>(
        'updates selected day forecast when valid forecast provided',
        build: () => weatherCubit,
        seed: () => WeatherState(
          weeklyForecast: weeklyForecast,
          selectedDayForecast: dayForecast1,
        ),
        act: (cubit) => cubit.selectDayForecast(dayForecast2),
        expect: () => [
          WeatherState(
            weeklyForecast: weeklyForecast,
            selectedDayForecast: dayForecast2,
          ),
        ],
      );

      blocTest<WeatherCubit, WeatherState>(
        'emits nothing when weeklyForecast is null',
        build: () => weatherCubit,
        act: (cubit) => cubit.selectDayForecast(dayForecast2),
        expect: () => [
          // We don't expect any state changes because the weeklyForecast is null
        ],
      );
    });

    group('toggleTemperatureUnit', () {
      blocTest<WeatherCubit, WeatherState>(
        'toggles from celsius to fahrenheit',
        build: () => weatherCubit,
        act: (cubit) => cubit.toggleTemperatureUnit(),
        expect: () => [
          const WeatherState(
            temperatureUnit: TemperatureUnit.fahrenheit,
          ),
        ],
      );

      blocTest<WeatherCubit, WeatherState>(
        'toggles from fahrenheit to celsius',
        build: () => weatherCubit,
        seed: () => const WeatherState(
          temperatureUnit: TemperatureUnit.fahrenheit,
        ),
        act: (cubit) => cubit.toggleTemperatureUnit(),
        expect: () => [
          const WeatherState(
            temperatureUnit: TemperatureUnit.celsius,
          ),
        ],
      );

      blocTest<WeatherCubit, WeatherState>(
        'preserves other state properties when toggling temperature unit',
        build: () => weatherCubit,
        seed: () => WeatherState(
          weeklyForecast: weeklyForecast,
          selectedDayForecast: dayForecast1,
        ),
        act: (cubit) => cubit.toggleTemperatureUnit(),
        expect: () => [
          WeatherState(
            weeklyForecast: weeklyForecast,
            selectedDayForecast: dayForecast1,
            temperatureUnit: TemperatureUnit.fahrenheit,
          ),
        ],
      );
    });
  });
}
