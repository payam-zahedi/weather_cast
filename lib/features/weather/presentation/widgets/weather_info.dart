import 'package:flutter/material.dart';
import 'package:weather_cast/core/extensions/theme_extentions.dart';
import 'package:weather_cast/features/weather/domain/entities/forecast.dart';
import 'package:weather_cast/features/weather/presentation/utils/weather_utills.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
    required this.forecast,
  });

  final ForecastEntity forecast;

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer.withAlpha(200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _DetailRow(
            icon: Icons.water_drop,
            label: 'Humidity',
            value: '${forecast.humidity}%',
            iconColor: Colors.blue,
          ),
          const SizedBox(height: 12),
          _DetailRow(
            icon: Icons.air,
            label: 'Wind Speed',
            value: WeatherUnitsFormatter.formatWindSpeed(forecast.windSpeed),
            iconColor: primaryColor,
          ),
          const SizedBox(height: 12),
          _DetailRow(
            icon: Icons.compress,
            label: 'Pressure',
            value: WeatherUnitsFormatter.formatPressure(forecast.pressure),
            iconColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withAlpha(35),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: iconColor),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(
            color: Colors.blueGrey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
