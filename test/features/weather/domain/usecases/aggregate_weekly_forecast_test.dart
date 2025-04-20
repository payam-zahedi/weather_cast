import 'package:flutter_test/flutter_test.dart';
import 'package:weather_cast/features/weather/domain/entities/forecast.dart';
import 'package:weather_cast/features/weather/domain/entities/weather_forecast.dart';
import 'package:weather_cast/features/weather/domain/usecases/aggregate_weekly_forecast.dart';

void main() {
  late AggregateWeeklyForecastUseCase usecase;

  setUp(() {
    usecase = const AggregateWeeklyForecastUseCase();
  });

  group('execute', () {
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));

    final todayForecast1 = ForecastEntity(
      weatherStatus: 'Clear',
      weatherDescription: 'clear sky',
      weatherIcon: '01d',
      temperature: 25.0,
      feelsLike: 26.0,
      humidity: 60,
      pressure: 1013,
      windSpeed: 5.0,
    );

    final todayForecast2 = ForecastEntity(
      weatherStatus: 'Clear',
      weatherDescription: 'clear sky',
      weatherIcon: '01n',
      temperature: 20.0,
      feelsLike: 21.0,
      humidity: 70,
      pressure: 1010,
      windSpeed: 4.0,
    );

    final tomorrowForecast = ForecastEntity(
      weatherStatus: 'Rain',
      weatherDescription: 'light rain',
      weatherIcon: '10d',
      temperature: 18.0,
      feelsLike: 17.0,
      humidity: 80,
      pressure: 1008,
      windSpeed: 6.0,
    );

    final weatherForecast = WeatherForecastEntity(
      cityName: 'London',
      forecasts: {
        today: [todayForecast1, todayForecast2],
        tomorrow: [tomorrowForecast],
      },
    );

    test('should handle empty forecast data', () {
      // arrange
      final emptyForecast = WeatherForecastEntity(
        cityName: 'London',
        forecasts: {},
      );

      // act
      final result = usecase.execute(emptyForecast);

      // assert
      expect(result.isRight(), true);
      final weeklyForecast = result
          .getOrElse(() => throw Exception('Failed to get weekly forecast'));
      expect(weeklyForecast.cityName, 'London');
      expect(weeklyForecast.dayForecasts.isEmpty, true);
    });

    test('should return aggregated weekly forecast data', () {
      // act
      final result = usecase.execute(weatherForecast);

      // assert
      expect(result.isRight(), true);
      final weeklyForecast = result
          .getOrElse(() => throw Exception('Failed to get weekly forecast'));

      // Check city name
      expect(weeklyForecast.cityName, 'London');

      // Check day forecasts count
      expect(weeklyForecast.dayForecasts.length, 2);

      // Check today's forecast
      final todayResult =
          weeklyForecast.dayForecasts.firstWhere((day) => day.date == today);
      expect(todayResult.forecasts.length, 2);
      expect(todayResult.currentForecast,
          todayForecast1); // Today's current forecast should be the first forecast

      // Check today's average forecast
      final todayAvg = todayResult.averageForecast;
      final expectedTemp =
          (todayForecast1.temperature + todayForecast2.temperature) / 2;
      final expectedHumidity =
          (todayForecast1.humidity + todayForecast2.humidity) / 2;
      final expectedWindSpeed =
          (todayForecast1.windSpeed + todayForecast2.windSpeed) / 2;

      expect(todayAvg.weatherStatus, 'Clear'); // Most representative weather
      expect(todayAvg.temperature, expectedTemp);
      expect(todayAvg.humidity, expectedHumidity);
      expect(todayAvg.windSpeed, expectedWindSpeed);

      // Check tomorrow's forecast
      final tomorrowResult =
          weeklyForecast.dayForecasts.firstWhere((day) => day.date == tomorrow);
      expect(tomorrowResult.forecasts.length, 1);
      expect(tomorrowResult.currentForecast,
          null); // Tomorrow should not have current forecast
      expect(tomorrowResult.averageForecast,
          tomorrowForecast); // With only one forecast, average is the same
    });

    test('should handle mixed weather conditions and select most frequent', () {
      // arrange
      final dayWithMixedWeather = today.add(const Duration(days: 2));
      final mixedForecast1 = ForecastEntity(
        weatherStatus: 'Clouds',
        weatherDescription: 'scattered clouds',
        weatherIcon: '03d',
        temperature: 22.0,
        feelsLike: 23.0,
        humidity: 65,
        pressure: 1012,
        windSpeed: 4.0,
      );

      final mixedForecast2 = ForecastEntity(
        weatherStatus: 'Rain',
        weatherDescription: 'light rain',
        weatherIcon: '10d',
        temperature: 20.0,
        feelsLike: 19.0,
        humidity: 75,
        pressure: 1010,
        windSpeed: 5.0,
      );

      final mixedForecast3 = ForecastEntity(
        weatherStatus: 'Cloude',
        weatherDescription: 'broken clouds',
        weatherIcon: '04d',
        temperature: 21.0,
        feelsLike: 22.0,
        humidity: 70,
        pressure: 1011,
        windSpeed: 4.5,
      );

      final mixedWeatherForecast = WeatherForecastEntity(
        cityName: 'Berlin',
        forecasts: {
          dayWithMixedWeather: [mixedForecast1, mixedForecast2, mixedForecast3],
        },
      );

      // act
      final result = usecase.execute(mixedWeatherForecast);

      // assert
      expect(result.isRight(), true);
      final weeklyForecast = result
          .getOrElse(() => throw Exception('Failed to get weekly forecast'));

      final dayResult = weeklyForecast.dayForecasts.first;
      expect(dayResult.date, dayWithMixedWeather);
      expect(dayResult.forecasts.length, 3);

      // Check that 'Clouds' is selected as most representative (appears twice)
      expect(dayResult.averageForecast.weatherStatus, 'Clouds');

      // Check average calculations
      final expectedTemp = (mixedForecast1.temperature +
              mixedForecast2.temperature +
              mixedForecast3.temperature) /
          3;
      final expectedHumidity = (mixedForecast1.humidity +
              mixedForecast2.humidity +
              mixedForecast3.humidity) /
          3;
      final expectedWindSpeed = (mixedForecast1.windSpeed +
              mixedForecast2.windSpeed +
              mixedForecast3.windSpeed) /
          3;

      expect(dayResult.averageForecast.temperature, expectedTemp);
      expect(dayResult.averageForecast.humidity, expectedHumidity);
      expect(dayResult.averageForecast.windSpeed, expectedWindSpeed);
    });
  });
}
