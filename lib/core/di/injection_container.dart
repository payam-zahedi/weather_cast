import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// Core
import 'package:weather_cast/core/network/api_client.dart';
import 'package:weather_cast/core/network/network_info.dart';
import 'package:weather_cast/core/constants/api_constants.dart';

// Features
import 'package:weather_cast/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:weather_cast/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_cast/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_cast/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_cast/features/weather/domain/usecases/aggregate_weekly_forecast.dart';
import 'package:weather_cast/features/weather/domain/usecases/get_weather_forecast.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /// Services
  await _initServices();

  /// Features
  await _initWeather();
}

Future<void> _initServices() async {
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  // Configure Dio with OpenWeatherMap base URL
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
  getIt.registerLazySingleton(() => dio);

  getIt.registerLazySingleton(() => Connectivity());

  //! Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  getIt.registerLazySingleton(() => ApiClient(getIt()));
}

Future<void> _initWeather() async {
  // Data sources
  getIt.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(client: getIt()),
  );
  getIt.registerLazySingleton<WeatherLocalDataSource>(
    () => WeatherLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetWeatherForecastUseCase(getIt()));
  getIt.registerLazySingleton(() => AggregateWeeklyForecastUseCase());
}
