import 'package:weather_cast/features/weather/presentation/cubit/weather_state.dart';

/// Utility class for formatting weather values for display
class WeatherUnitsFormatter {
  /// Converts temperature from Kelvin to the selected unit (Celsius or Fahrenheit)
  static double formatTemperature(double kelvinTemp, TemperatureUnit unit) {
    return switch (unit) {
      TemperatureUnit.celsius => kelvinTemp - 273.15,
      TemperatureUnit.fahrenheit => (kelvinTemp - 273.15) * 9 / 5 + 32,
    };
  }

  /// Formats temperature with specified decimal places
  static String formatTemperatureWithUnit(
    double kelvinTemp,
    TemperatureUnit unit, {
    int decimalPlaces = 1,
  }) {
    final convertedTemp = formatTemperature(kelvinTemp, unit);
    return '${convertedTemp.toStringAsFixed(decimalPlaces)}${unit.sign}';
  }

  /// Converts wind speed from m/s to km/h and formats it
  static String formatWindSpeed(double windSpeedInMps,
      {int decimalPlaces = 1}) {
    // Convert from m/s to km/h (1 m/s = 3.6 km/h)
    final windSpeedInKmh = windSpeedInMps * 3.6;
    return '${windSpeedInKmh.toStringAsFixed(decimalPlaces)} km/h';
  }

  /// Formats pressure in hPa
  static String formatPressure(int pressureInHpa) {
    return '$pressureInHpa hPa';
  }
}
