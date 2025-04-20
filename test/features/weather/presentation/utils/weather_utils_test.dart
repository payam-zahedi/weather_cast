import 'package:flutter_test/flutter_test.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather_cast/features/weather/presentation/utils/weather_utills.dart';

void main() {
  group('WeatherUnitsFormatter', () {
    group('formatTemperature', () {
      test('should convert Kelvin to Celsius correctly', () {
        // Arrange
        const kelvinTemp = 300.15; // 27°C
        const expectedCelsius = 27.0;

        // Act
        final result = WeatherUnitsFormatter.formatTemperature(
            kelvinTemp, TemperatureUnit.celsius);

        // Assert
        expect(result, expectedCelsius);
      });

      test('should convert Kelvin to Fahrenheit correctly', () {
        // Arrange
        const kelvinTemp = 300.15; // 80.6°F
        const expectedFahrenheit = 80.6;

        // Act
        final result = WeatherUnitsFormatter.formatTemperature(
            kelvinTemp, TemperatureUnit.fahrenheit);

        // Assert
        expect(result, closeTo(expectedFahrenheit, 0.1));
      });
    });

    group('formatTemperatureWithUnit', () {
      test(
          'should format Celsius temperature with correct unit and decimal places',
          () {
        // Arrange
        const kelvinTemp = 300.15; // 27°C
        const expectedOutput = '27.0°C';

        // Act
        final result = WeatherUnitsFormatter.formatTemperatureWithUnit(
            kelvinTemp, TemperatureUnit.celsius);

        // Assert
        expect(result, expectedOutput);
      });

      test(
          'should format Fahrenheit temperature with correct unit and decimal places',
          () {
        // Arrange
        const kelvinTemp = 300.15; // 80.6°F
        const expectedOutput = '80.6°F';

        // Act
        final result = WeatherUnitsFormatter.formatTemperatureWithUnit(
            kelvinTemp, TemperatureUnit.fahrenheit);

        // Assert
        expect(result, expectedOutput);
      });

      test('should respect custom decimal places parameter', () {
        // Arrange
        const kelvinTemp = 300.15; // 27°C
        const expectedOutput = '27.00°C';

        // Act
        final result = WeatherUnitsFormatter.formatTemperatureWithUnit(
            kelvinTemp, TemperatureUnit.celsius,
            decimalPlaces: 2);

        // Assert
        expect(result, expectedOutput);
      });
    });

    group('formatWindSpeed', () {
      test('should convert m/s to km/h correctly and format with unit', () {
        // Arrange
        const windSpeedInMps = 10.0; // 36 km/h
        const expectedOutput = '36.0 km/h';

        // Act
        final result = WeatherUnitsFormatter.formatWindSpeed(windSpeedInMps);

        // Assert
        expect(result, expectedOutput);
      });

      test('should respect custom decimal places parameter', () {
        // Arrange
        const windSpeedInMps = 10.0; // 36 km/h
        const expectedOutput = '36.00 km/h';

        // Act
        final result = WeatherUnitsFormatter.formatWindSpeed(windSpeedInMps,
            decimalPlaces: 2);

        // Assert
        expect(result, expectedOutput);
      });
    });

    group('formatPressure', () {
      test('should format pressure with hPa unit', () {
        // Arrange
        const pressureInHpa = 1013;
        const expectedOutput = '1013 hPa';

        // Act
        final result = WeatherUnitsFormatter.formatPressure(pressureInHpa);

        // Assert
        expect(result, expectedOutput);
      });
    });
  });
}
