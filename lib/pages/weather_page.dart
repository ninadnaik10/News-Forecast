import 'package:flutter/material.dart';
import 'package:weather_news_app/main.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Text('Weather Page'),
    );

  }
}

