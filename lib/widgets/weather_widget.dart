import 'package:flutter/material.dart';
import 'package:weather_news_app/models/weather_model.dart';
import 'package:weather_news_app/pages/weather_page.dart';

class WeatherWidget extends StatefulWidget {
  final Current current;
  const WeatherWidget({Key? key, required this.current}) : super(key: key);

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          child: const Center(
            child: Text("Search Box"),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Text(widget.current.tempC.toString() ?? "No data"),
        )
      ],
    );
  }
}
