import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast/core/extensions/theme_extentions.dart';
import 'package:weather_cast/features/weather/domain/entities/weekly_forecast.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather_cast/features/weather/presentation/widgets/forecast_day_item.dart';
import 'package:weather_cast/features/weather/presentation/widgets/weather_detail_card.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return context.read<WeatherCubit>().fetchWeatherForecast();
      },
      child: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // City name
            _CityName(),
            // Weather detail card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: WeatherDetailCard(),
            ),
            // Horizontal list of day forecasts
            _HorizontalDayView(),
          ],
        ),
      ),
    );
  }
}

class _CityName extends StatelessWidget {
  const _CityName();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: context.colorScheme.primary,
            size: 24,
          ),
          const SizedBox(width: 8),
          BlocSelector<WeatherCubit, WeatherState, String?>(
            selector: (state) => state.weeklyForecast?.cityName,
            builder: (context, cityName) {
              return Text(
                cityName ?? '',
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _HorizontalDayView extends StatelessWidget {
  const _HorizontalDayView();

  @override
  Widget build(BuildContext context) {
    final WeeklyForecastEntity weeklyForecast =
        context.select<WeatherCubit, WeeklyForecastEntity>(
      (value) => value.state.weeklyForecast!,
    );

    final DayForecastEntity selectedForecast =
        context.select<WeatherCubit, DayForecastEntity>(
      (value) => value.state.selectedDayForecast!,
    );

    final temperatureUnit = context.select<WeatherCubit, TemperatureUnit>(
      (value) => value.state.temperatureUnit,
    );

    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: weeklyForecast.dayForecasts.length,
        itemBuilder: (context, index) {
          final dayForecast = weeklyForecast.dayForecasts[index];

          return GestureDetector(
            key: Key(dayForecast.date.toString()),
            onTap: () {
              // Update the selected day forecast
              context.read<WeatherCubit>().selectDayForecast(dayForecast);
            },
            child: DayForecastFactory.create(
              dayForecast: dayForecast,
              temperatureUnit: temperatureUnit,
              selectedForecast: selectedForecast,
            ),
          );
        },
      ),
    );
  }
}
