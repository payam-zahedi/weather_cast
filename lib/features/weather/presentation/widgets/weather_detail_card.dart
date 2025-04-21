import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';
import 'package:weather_cast/core/constants/api_constants.dart';
import 'package:weather_cast/core/extensions/theme_extentions.dart';
import 'package:weather_cast/features/weather/domain/entities/weekly_forecast.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather_cast/features/weather/presentation/utils/weather_utills.dart';
import 'package:weather_cast/features/weather/presentation/widgets/weather_info.dart';

class WeatherDetailCard extends StatelessWidget {
  const WeatherDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    final temperatureUnit = context.select<WeatherCubit, TemperatureUnit>(
      (value) => value.state.temperatureUnit,
    );

    final selectedDayForecast =
        context.select<WeatherCubit, DayForecastEntity?>(
      (value) => value.state.selectedDayForecast,
    );

    /// if selectedDayForecast is not null that means we are on today forecast
    final forecast = selectedDayForecast!.currentForecast ??
        selectedDayForecast.averageForecast;
    final date = selectedDayForecast.date;

    final dateFormat = DateFormat('EEEE, MMM d');
    final cardColor = context.colorScheme.surface;
    final primaryColor = context.colorScheme.primary;

    return Card(
      elevation: 4,
      shadowColor: primaryColor.withAlpha(100),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              cardColor,
              cardColor.withAlpha(25),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 18,
                    color: primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    dateFormat.format(date),
                    style: context.textTheme.titleLarge,
                  ),
                ],
              ),
              const Divider(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 110,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              ApiConstants.getIconUrl(forecast.weatherIcon),
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          forecast.weatherDescription.titleCase,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          WeatherUnitsFormatter.formatTemperatureWithUnit(
                            forecast.temperature,
                            temperatureUnit,
                          ),
                          style: context.textTheme.headlineMedium?.copyWith(
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(32),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Feels like: ${WeatherUnitsFormatter.formatTemperatureWithUnit(
                              forecast.feelsLike,
                              temperatureUnit,
                            )}',
                            style: context.textTheme.titleMedium?.copyWith(
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              WeatherInfo(forecast: forecast),
            ],
          ),
        ),
      ),
    );
  }
}
