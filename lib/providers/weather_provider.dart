import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_forecast/services/weather_services.dart';

import '../models/weather_model.dart';

part 'weather_provider.freezed.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(true) bool isLoading,
    required WeatherModel weatherModel,
  }) = _WeatherState;

  const WeatherState._();
}

class WeatherNotifier extends StateNotifier<WeatherState> {
  WeatherNotifier()
      : super(WeatherState(weatherModel: WeatherModel(current: null))) {
    loadWeather();
  }

  loadWeather() async {
    state = state.copyWith(isLoading: true);
    final weatherResponse = await WeatherServices().getWeatherData();
    final weather = WeatherModel.fromJson(weatherResponse);
    state = state.copyWith(weatherModel: weather, isLoading: false);
  }
}

final weatherProvider = StateNotifierProvider<WeatherNotifier, WeatherState>(
    (ref) => WeatherNotifier());
