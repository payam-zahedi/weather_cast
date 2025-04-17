import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather_cast/features/weather/data/models/forecast_model.dart';

part 'forecast_result_model.freezed.dart';
part 'forecast_result_model.g.dart';

@freezed
class ForecastResult with _$ForecastResult {
  const factory ForecastResult({
    required String cod,
    required int message,
    required int cnt,
    required List<Forecast> list,
    required City city,
  }) = _ForecastResult;

  factory ForecastResult.fromJson(Map<String, dynamic> json) =>
      _$ForecastResultFromJson(json);
}

@freezed
class City with _$City {
  const factory City({
    required int id,
    required String name,
    required Coord coord,
    required String country,
    required int population,
    required int timezone,
    required int sunrise,
    required int sunset,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@freezed
class Coord with _$Coord {
  const factory Coord({
    required double lat,
    required double lon,
  }) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}
