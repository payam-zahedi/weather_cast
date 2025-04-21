import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast/features/weather/presentation/widgets/temp_view.dart';
import 'package:weather_cast/features/weather/presentation/widgets/weather_body.dart';
import 'package:weather_cast/core/widgets/error_widget.dart';
import 'package:weather_cast/core/widgets/loading_widget.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_state.dart';

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
      body: ColoredBox(
        color: Theme.of(context).colorScheme.surfaceContainer,
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
    );
  }
}
