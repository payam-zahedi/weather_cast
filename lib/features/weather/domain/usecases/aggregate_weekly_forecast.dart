import 'package:dartz/dartz.dart';
import 'package:weather_cast/core/errors/failures.dart';
import 'package:weather_cast/core/extensions/datetime_extensions.dart';
import 'package:weather_cast/features/weather/domain/entities/forecast.dart';
import 'package:weather_cast/features/weather/domain/entities/weather_forecast.dart';
import 'package:weather_cast/features/weather/domain/entities/weekly_forecast.dart';

/// AggregateWeeklyForecastUseCase is responsible for transforming raw forecast data
/// into an organized weekly forecast structure, categorized by day.
///
/// This use case processes raw [WeatherForecastEntity] data by:
/// 1. Grouping forecasts by day
/// 2. Finding the most representative weather condition for each day
/// 3. Calculating average weather metrics (temperature, humidity, etc.) for each day
/// 4. Identifying the current forecast for today
/// 5. Returning a structured [WeeklyForecastEntity] with all processed data
///
/// Following Clean Architecture principles, this class belongs in the Domain layer
/// as a use case that implements business logic independent of data sources or UI.
class AggregateWeeklyForecastUseCase {
  const AggregateWeeklyForecastUseCase();

  /// Transforms raw weather forecast data into an organized weekly forecast structure.
  ///
  /// Takes [weatherForecast] containing multiple forecast entries and processes them
  /// to create a well-structured weekly forecast with daily aggregations.
  ///
  /// Returns [Either] a [Failure] or a [WeeklyForecastEntity] containing the processed data.
  Either<Failure, WeeklyForecastEntity> execute(
      WeatherForecastEntity weatherForecast) {
    final List<DayForecastEntity> dayForecasts = [];

    for (final day in weatherForecast.forecasts.keys) {
      final forecasts = weatherForecast.forecasts[day]!;
      final mostRepresentativeWeather =
          _findMostRepresentativeWeather(forecasts);
      final averageForecast = _calculateAverageForecastSpecs(
        forecasts,
        mostRepresentativeWeather,
      );

      // if day is today, add the current forecast to the day forecasts
      ForecastEntity? currentForecast;
      if (day.isToday) {
        currentForecast = forecasts.first;
      }

      dayForecasts.add(DayForecastEntity(
        date: day,
        currentForecast: currentForecast,
        averageForecast: averageForecast,
        forecasts: forecasts,
      ));
    }

    return Right(
      WeeklyForecastEntity(
        cityName: weatherForecast.cityName,
        dayForecasts: dayForecasts,
      ),
    );
  }

  /// Finds the most representative weather condition for a day by identifying
  /// the most frequently occurring weather status across all forecasts.
  ///
  /// Takes a list of [forecasts] for a single day.
  /// Returns the [ForecastEntity] with the most common weather status.
  ForecastEntity _findMostRepresentativeWeather(
      List<ForecastEntity> forecasts) {
    // Count occurrences of each weather condition
    final Map<String, int> weatherFrequency = {};
    final Map<String, ForecastEntity> weatherByMain = {};

    for (final forecast in forecasts) {
      final weatherStatus = forecast.weatherStatus;

      weatherFrequency[weatherStatus] =
          (weatherFrequency[weatherStatus] ?? 0) + 1;
      weatherByMain[weatherStatus] = forecast;
    }

    // Find most frequent condition
    String mostFrequentWeather = weatherFrequency.entries
        .reduce((max, entry) => entry.value > max.value ? entry : max)
        .key;

    return weatherByMain[mostFrequentWeather]!;
  }

  /// Calculates average values for all weather metrics (temperature, humidity, etc.)
  /// while preserving the descriptive aspects of the most representative weather.
  ///
  /// Takes a list of [forecasts] for a single day and the [weather] representing
  /// the most common condition.
  /// Returns a [ForecastEntity] with averaged numerical values and descriptive elements
  /// from the most representative weather.
  ForecastEntity _calculateAverageForecastSpecs(
    List<ForecastEntity> forecasts,
    ForecastEntity weather,
  ) {
    double sumTemp = 0, sumFeelsLike = 0, sumPressure = 0, sumWindSpeed = 0;
    int sumHumidity = 0;

    for (final forecast in forecasts) {
      sumTemp += forecast.temperature;
      sumFeelsLike += forecast.feelsLike;
      sumHumidity += forecast.humidity;
      sumPressure += forecast.pressure;
      sumWindSpeed += forecast.windSpeed;
    }

    final count = forecasts.length;

    return ForecastEntity(
      weatherStatus: weather.weatherStatus,
      weatherDescription: weather.weatherDescription,
      weatherIcon: weather.weatherIcon,
      temperature: sumTemp / count,
      feelsLike: sumFeelsLike / count,
      humidity: (sumHumidity / count).round(),
      pressure: (sumPressure / count).round(),
      windSpeed: sumWindSpeed / count,
    );
  }
}
