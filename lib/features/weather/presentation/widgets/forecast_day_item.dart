import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_cast/core/constants/api_constants.dart';
import 'package:weather_cast/core/extensions/theme_extentions.dart';
import 'package:weather_cast/features/weather/domain/entities/forecast.dart';
import 'package:weather_cast/features/weather/domain/entities/weekly_forecast.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather_cast/features/weather/presentation/utils/weather_utills.dart';

class DayForecastFactory {
  static Widget create({
    required DayForecastEntity dayForecast,
    required DayForecastEntity? selectedForecast,
    required TemperatureUnit temperatureUnit,
  }) {
    final isToday = dayForecast.currentForecast != null;
    final isSelected = dayForecast == selectedForecast;

    final weekDayText = isToday ? 'Today' : null;

    final forecast = isToday
        ? dayForecast.currentForecast ?? dayForecast.averageForecast
        : dayForecast.averageForecast;

    return switch (isSelected) {
      true => SelectedDayForecast(
          date: dayForecast.date,
          forecast: forecast,
          temperatureUnit: temperatureUnit,
          weekDayText: weekDayText,
        ),
      false => ForecastDayItem(
          date: dayForecast.date,
          forecast: forecast,
          temperatureUnit: temperatureUnit,
          weekDayText: weekDayText,
        ),
    };
  }
}

class ForecastDayItem extends StatelessWidget {
  const ForecastDayItem({
    super.key,
    required this.date,
    required this.forecast,
    required this.temperatureUnit,
    this.weekDayText,
  });
  final DateTime date;
  final ForecastEntity forecast;
  final TemperatureUnit temperatureUnit;
  final String? weekDayText;

  @override
  Widget build(BuildContext context) {
    final dayFormat = DateFormat('E');
    final dateFormat = DateFormat('d');
    final cardColor = context.colorScheme.surface;

    final weekDay = weekDayText ?? dayFormat.format(date);

    return Card(
      color: cardColor,
      elevation: 1,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide.none,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weekDay,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              dateFormat.format(date),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(12),
              ),
              child: CachedNetworkImage(
                imageUrl: ApiConstants.getIconUrl(forecast.weatherIcon),
                width: 56,
                height: 56,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              WeatherUnitsFormatter.formatTemperatureWithUnit(
                forecast.temperature,
                temperatureUnit,
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedDayForecast extends StatelessWidget {
  const SelectedDayForecast({
    super.key,
    required this.date,
    required this.forecast,
    required this.temperatureUnit,
    this.weekDayText,
  });

  final DateTime date;
  final ForecastEntity forecast;
  final TemperatureUnit temperatureUnit;
  final String? weekDayText;

  @override
  Widget build(BuildContext context) {
    final dayFormat = DateFormat('E');
    final dateFormat = DateFormat('d');
    final primaryColor = context.colorScheme.primary;
    final cardColor = context.colorScheme.primaryContainer;

    final weekDay = weekDayText ?? dayFormat.format(date);

    return Card(
      color: cardColor,
      elevation: 4,
      shadowColor: primaryColor.withAlpha(125),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: primaryColor, width: 2),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weekDay,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: primaryColor,
              ),
            ),
            Text(
              dateFormat.format(date),
              style: TextStyle(
                fontSize: 14,
                color: primaryColor.withAlpha(150),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: primaryColor.withAlpha(45),
                borderRadius: BorderRadius.circular(12),
              ),
              child: CachedNetworkImage(
                imageUrl: ApiConstants.getIconUrl(forecast.weatherIcon),
                width: 56,
                height: 56,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              WeatherUnitsFormatter.formatTemperatureWithUnit(
                forecast.temperature,
                temperatureUnit,
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
