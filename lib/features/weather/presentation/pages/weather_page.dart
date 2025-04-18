import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';
import 'package:weather_cast/core/constants/api_constants.dart';
import 'package:weather_cast/features/weather/presentation/widgets/weather_detail_card.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/entities/forecast.dart';
import '../cubit/weather_cubit.dart';
import '../cubit/weather_state.dart';
import '../widgets/forecast_day_item.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().fetchWeatherForecast();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather Cast',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          BlocSelector<WeatherCubit, WeatherState, TemperatureUnit>(
              selector: (state) => state.temperatureUnit,
              builder: (context, temperatureUnit) {
                return PopupMenuButton<TemperatureUnit>(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const Icon(Icons.device_thermostat_outlined),
                        const SizedBox(width: 4),
                        Text(
                          temperatureUnit.sign,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  onSelected: (unit) {
                    context.read<WeatherCubit>().toggleTemperatureUnit();
                  },
                  itemBuilder: (context) => TemperatureUnit.values
                      .map(
                        (unit) => CheckedPopupMenuItem(
                          checked: temperatureUnit == unit,
                          value: unit,
                          child: Text(unit.name),
                        ),
                      )
                      .toList(),
                );
              }),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surfaceContainer,
              Theme.of(context).colorScheme.surfaceContainer.withBlue(
                    230,
                  ),
            ],
          ),
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
                    if (state.isLoading) {
                      return const LoadingWidget();
                    } else if (state.errorMessage != null) {
                      return AppErrorWidget(
                        message: state.errorMessage!,
                        onRetry: () => _refreshWeather(context),
                      );
                    } else if (state.weeklyForecast != null) {
                      return WeatherBody();
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_outlined,
                              size: 80,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withAlpha(122),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Search for a city to see weather',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _refreshWeather(BuildContext context) {
    context.read<WeatherCubit>().fetchWeatherForecast();
  }
}

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          final weeklyForecast = state.weeklyForecast!;
          final selectedForecast =
              state.selectedDayForecast ?? weeklyForecast.dayForecasts.first;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      weeklyForecast.cityName,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child:const WeatherDetailCard(),
              ),
              // Horizontal list of day forecasts
              SizedBox(
                height: 200,
                child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: weeklyForecast.dayForecasts.length,
                  itemBuilder: (context, index) {
                    final dayForecast = weeklyForecast.dayForecasts[index];
                    final isSelected = dayForecast == selectedForecast;

                    return GestureDetector(
                      onTap: () {
                        // Update the selected day forecast
                        context
                            .read<WeatherCubit>()
                            .selectDayForecast(dayForecast);
                      },
                      child: ForecastDayItem(
                        dayForecast: dayForecast,
                        isSelected: isSelected,
                        temperatureUnit: state.temperatureUnit,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
