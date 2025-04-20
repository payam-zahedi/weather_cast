import 'package:bloc/bloc.dart';
import 'package:weather_cast/features/weather/domain/entities/weekly_forecast.dart';
import 'package:weather_cast/features/weather/domain/usecases/aggregate_weekly_forecast.dart';
import 'package:weather_cast/features/weather/domain/usecases/get_weather_forecast.dart';
import 'package:weather_cast/features/weather/presentation/cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({
    required this.getWeatherForecastUseCase,
    required this.aggregateWeeklyForecastUseCase,
  }) : super(WeatherState());

  final GetWeatherForecastUseCase getWeatherForecastUseCase;
  final AggregateWeeklyForecastUseCase aggregateWeeklyForecastUseCase;

  Future<void> fetchWeatherForecast({String cityName = 'Berlin'}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    final result = await getWeatherForecastUseCase.execute(cityName);

    result.fold(
      /// If the result is a failure, emit an error message
      (failure) => emit(state.copyWith(
        errorMessage: failure.message,
        isLoading: false,
      )),

      /// If the result is a success, aggregate the weekly forecast
      (weatherForecast) {
        final weeklyResult =
            aggregateWeeklyForecastUseCase.execute(weatherForecast);

        weeklyResult.fold(
          (failure) => emit(
            state.copyWith(
              errorMessage: failure.message,
              isLoading: false,
            ),
          ),

          /// If the weekly forecast is a success, emit the weekly forecast
          (weeklyForecast) => emit(
            state.copyWith(
              selectedDayForecast: weeklyForecast.dayForecasts.first,
              weeklyForecast: weeklyForecast,
              isLoading: false,
            ),
          ),
        );
      },
    );
  }

  void selectDayForecast(DayForecastEntity dayForecast) {
    if (state.weeklyForecast != null) {
      emit(state.copyWith(selectedDayForecast: dayForecast));
    }
  }

  void toggleTemperatureUnit() {
    emit(
      state.copyWith(
        temperatureUnit: state.temperatureUnit == TemperatureUnit.celsius
            ? TemperatureUnit.fahrenheit
            : TemperatureUnit.celsius,
      ),
    );
  }
}
