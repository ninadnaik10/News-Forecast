import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:news_forecast/constants/key.dart';
import 'package:news_forecast/services/location_services.dart';

class WeatherServices {
  late DioCacheManager _dioCacheManager;

  final Dio _dio = Dio(
    BaseOptions(
      responseType: ResponseType.json,
    ),
  );

  getWeatherData() async {
    // final queryParams = {
    //   'key' : WEATHER_API_KEY,
    //   'q' : place
    // };
    // final weatherURL = Uri.http();
    _dioCacheManager = DioCacheManager(CacheConfig());
    Options _cacheOptions = buildCacheOptions(const Duration(days: 2), forceRefresh: true);
    _dio.interceptors.add(_dioCacheManager.interceptor);
    // print("here");
    final locationData = await LocationServices().getCity();
    // print(locationData);
    var response = await _dio.get(
      'https://api.weatherapi.com/v1/current.json?q=$locationData&key=$WEATHER_API_KEY', options: _cacheOptions
    );
    if (response.statusCode == 200) {
      // print(response.data);
      return response.data;
    } else {
      throw Exception("Can not get weather");
    }
  }
}
