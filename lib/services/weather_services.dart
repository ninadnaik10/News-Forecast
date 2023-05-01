import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:weather_news_app/constants/key.dart';
import 'package:weather_news_app/models/weather_model.dart';

class WeatherServices {
  final Dio _dio = Dio(
    BaseOptions(
      responseType: ResponseType.json,
    ),
  );

  getWeatherData(String place) async {
    // final queryParams = {
    //   'key' : WEATHER_API_KEY,
    //   'q' : place
    // };
    // final weatherURL = Uri.http();
    var response = await _dio.get('https://api.weatherapi.com/v1/current.json?q=$place&key=$WEATHER_API_KEY');
    if (response.statusCode == 200){
      return response.data;
    }
    else {
      throw Exception("Can not get weather");
    }
  }
}