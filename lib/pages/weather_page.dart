import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_news_app/models/weather_model.dart';
import 'package:weather_news_app/widgets/weather_widget.dart';
import 'package:weather_news_app/services/weather_services.dart';
import 'package:weather_news_app/providers/weather_provider.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WeatherModel weather = ref.watch(weatherProvider).weatherModel;
    bool isLoading = ref.watch(weatherProvider).isLoading;
    return isLoading
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : WeatherWidget(current: weather.current!, location: weather.location!);
  }

}
