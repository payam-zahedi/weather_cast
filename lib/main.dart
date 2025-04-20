import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_cast/features/weather/presentation/pages/weather_page.dart';
import 'core/di/injection_container.dart' as di;
import 'core/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (_) => WeatherCubit(
            getWeatherForecastUseCase: di.getIt(),
            aggregateWeeklyForecastUseCase: di.getIt(),
          )..fetchWeatherForecast(),
        ),
        // Add more BlocProviders as needed
      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        scrollBehavior: ScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        home: const WeatherPage(),
      ),
    );
  }
}
