import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast.freezed.dart';

@freezed
class ForecastEntity with _$ForecastEntity {
  factory ForecastEntity({
    required String weatherStatus,
    required String weatherDescription,
    required String weatherIcon,
    required double temperature,
    required double feelsLike,
    required int humidity,
    required int pressure,
    required double windSpeed,
  }) = _ForecastEntity;
}