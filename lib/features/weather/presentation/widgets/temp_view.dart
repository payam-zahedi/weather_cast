import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_state.dart';

class TemperatureUnitView extends StatelessWidget {
  const TemperatureUnitView({super.key});

  @override
  Widget build(BuildContext context) {
    final temperatureUnit = context.select<WeatherCubit, TemperatureUnit>(
      (value) => value.state.temperatureUnit,
    );
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
  }
}
