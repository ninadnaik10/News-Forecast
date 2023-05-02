import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:weather_news_app/constants/key.dart';
import 'package:weather_news_app/models/weather_model.dart';

class WeatherServices {

  late DioCacheManager _dioCacheManager;

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
    _dioCacheManager = DioCacheManager(CacheConfig());
    Options _cacheOptions = buildCacheOptions(const Duration(days: 2), forceRefresh: true);
    _dio.interceptors.add(_dioCacheManager.interceptor);

    var response = await _dio.get('https://api.weatherapi.com/v1/current.json?q=$place&key=$WEATHER_API_KEY', options: _cacheOptions);
    if (response.statusCode == 200){
      return response.data;
    }
    else {
      throw Exception("Can not get weather");
    }
  }
}