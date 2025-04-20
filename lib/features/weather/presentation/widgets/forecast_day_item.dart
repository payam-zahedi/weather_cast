import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_cast/core/constants/api_constants.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather_cast/features/weather/presentation/utils/temperature_formatter.dart';
import 'package:weather_cast/features/weather/domain/entities/weekly_forecast.dart';

class ForecastDayItem extends StatelessWidget {
  final DayForecastEntity dayForecast;
  final bool isSelected;
  final TemperatureUnit temperatureUnit;

  const ForecastDayItem({
    super.key,
    required this.dayForecast,
    required this.isSelected,
    required this.temperatureUnit,
  });

  @override
  Widget build(BuildContext context) {
    final forecast = dayForecast.averageForecast;
    final dayFormat = DateFormat('E');
    final dateFormat = DateFormat('d');
    final primaryColor = Theme.of(context).colorScheme.primary;
    final cardColor = isSelected
        ? Theme.of(context).colorScheme.primaryContainer
        : Theme.of(context).colorScheme.surface;

    return Card(
      color: cardColor,
      elevation: isSelected ? 4 : 1,
      shadowColor: isSelected ? primaryColor.withAlpha(125) : Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isSelected
            ? BorderSide(color: primaryColor, width: 2)
            : BorderSide.none,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayFormat.format(dayForecast.date),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isSelected ? primaryColor : null,
              ),
            ),
            Text(
              dateFormat.format(dayForecast.date),
              style: TextStyle(
                fontSize: 14,
                color:
                    isSelected ? primaryColor.withAlpha(150) : Colors.grey[600],
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isSelected ? primaryColor.withAlpha(45) : Colors.black12,
                borderRadius: BorderRadius.circular(12),
              ),
              child: CachedNetworkImage(
                imageUrl: ApiConstants.getIconUrl(forecast.weatherIcon),
                width: 56,
                height: 56,
                placeholder: (context, url) => const SizedBox(
                  width: 56,
                  height: 56,
                  child:
                      Center(child: CircularProgressIndicator(strokeWidth: 2)),
                ),
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
                color: isSelected ? primaryColor : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
