import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast/features/weather/domain/entities/weekly_forecast.dart';
import 'package:weather_cast/features/weather/presentation/widgets/temp_view.dart';
import 'package:weather_cast/features/weather/presentation/widgets/weather_detail_card.dart';
import 'package:weather_cast/core/widgets/error_widget.dart';
import 'package:weather_cast/core/widgets/loading_widget.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather_cast/features/weather/presentation/widgets/forecast_day_item.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather Cast',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          const TemperatureUnitView(),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                    if (state.errorMessage != null) {
                      return AppErrorWidget(
                        message: state.errorMessage!,
                        onRetry: () =>
                            context.read<WeatherCubit>().fetchWeatherForecast(),
                      );
                    } else if (state.weeklyForecast != null) {
                      return const WeatherBody();
                    }

                    return const LoadingWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return context.read<WeatherCubit>().fetchWeatherForecast();
      },
      child: const SingleChildScrollView(
        // physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // City name
            _CityName(),
            SizedBox(height: 0),
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
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
          const SizedBox(width: 8),
          BlocSelector<WeatherCubit, WeatherState, String?>(
              selector: (state) => state.weeklyForecast?.cityName,
              builder: (context, cityName) {
                return Text(
                  cityName ?? '',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                );
              }),
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

          final isToday = dayForecast.currentForecast != null;
          final isSelected = dayForecast == selectedForecast;

          return GestureDetector(
            onTap: () {
              // Update the selected day forecast
              context.read<WeatherCubit>().selectDayForecast(dayForecast);
            },
            child: ForecastDayItem(
              dayForecast: dayForecast,
              isToday: isToday,
              isSelected: isSelected,
              temperatureUnit: temperatureUnit,
            ),
          );
        },
      ),
    );
  }
}
