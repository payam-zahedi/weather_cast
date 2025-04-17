import 'package:weather_cast/features/weather/data/models/forecast_model.dart';
import 'package:weather_cast/features/weather/data/models/forecast_result_model.dart';
import 'package:weather_cast/features/weather/domain/entities/weather_forecast.dart';

/// Mapper for converting data models to domain entities
class ForecastMapper {
  /// Maps a ForecastResult to a WeatherForecast domain entity
  static WeatherForecast toWeatherForecast(ForecastResult forecastResult) {
    // Group forecasts by date
    final Map<DateTime, List<Forecast>> forecastsByDay = {};

    // Organize forecasts into day groups
    for (final forecast in forecastResult.list) {
      final dayDateTime =
          DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000);
      final dayDate =
          DateTime(dayDateTime.year, dayDateTime.month, dayDateTime.day);

      // Add to map using computeIfAbsent for cleaner code
      forecastsByDay.putIfAbsent(dayDate, () => []).add(forecast);
    }

    // Process each day's forecasts
    final dayForecasts = forecastsByDay.map((key, value) {
      final date = key;
      final forecasts = value;

      // Find the mostnt for the day
      final mostRepresentativeWeather =
          _findMostRepresentativeWeather(forecasts);

      // Calculate average forecast specifications
      final averageForecast = _calculateAverageForecastSpecs(forecasts);

      return MapEntry(
        date,
        DayForecast(
          weatherStatus: mostRepresentativeWeather.main,
          weatherDescription: mostRepresentativeWeather.description,
          weatherIcon: mostRepresentativeWeather.icon,
          averageForecast: averageForecast,
        ),
      );
    });

    return WeatherForecast(
      cityName: forecastResult.city.name,
      dayForecasts: dayForecasts,
    );
  }

  /// Find the most representative weather for a day
  static Weather _findMostRepresentativeWeather(List<Forecast> forecasts) {
    // Count occurrences of each weather condition
    final Map<String, int> weatherFrequency = {};
    final Map<String, Weather> weatherByMain = {};

    for (final forecast in forecasts) {
      final weather = forecast.weather.first;
      final weatherMain = weather.main;

      weatherFrequency[weatherMain] = (weatherFrequency[weatherMain] ?? 0) + 1;
      weatherByMain[weatherMain] = weather;
    }

    // Find most frequent condition
    String mostFrequentWeather = weatherFrequency.entries
        .reduce((max, entry) => entry.value > max.value ? entry : max)
        .key;

    return weatherByMain[mostFrequentWeather]!;
  }

  /// Calculate average forecast specifications
  static ForecastSpecs _calculateAverageForecastSpecs(
      List<Forecast> forecasts) {
    double sumTemp = 0, sumFeelsLike = 0, sumPressure = 0, sumWindSpeed = 0;
    int sumHumidity = 0;

    for (final forecast in forecasts) {
      sumTemp += forecast.main.temp;
      sumFeelsLike += forecast.main.feelsLike;
      sumHumidity += forecast.main.humidity;
      sumPressure += forecast.main.pressure.toDouble();
      sumWindSpeed += forecast.wind.speed;
    }

    final count = forecasts.length;

    return ForecastSpecs(
      temperature: sumTemp / count,
      feelsLike: sumFeelsLike / count,
      humidity: (sumHumidity / count).round(),
      pressure: sumPressure / count,
      windSpeed: sumWindSpeed / count,
    );
  }
}
