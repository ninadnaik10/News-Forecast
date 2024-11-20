import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dio/dio.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:news_forecast/constants/key.dart';
import 'package:news_forecast/services/location_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  // late DioCacheManager _dioCacheManager;
  //
  // final Dio _dio = Dio(
  //   BaseOptions(
  //     responseType: ResponseType.json,
  //   ),
  // );

  getWeatherData() async {
    final locationData = await LocationServices().getCity();
    final weatherUrl = "https://api.weatherapi.com/v1/current.json?q=$locationData&key=$WEATHER_API_KEY";
    // final cacheManager = DefaultCacheManager();
    // final file = await cacheManager.getSingleFile(newsApiUrl);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final connectivityResult = await (Connectivity().checkConnectivity());

    if(connectivityResult == ConnectivityResult.none){
      final results = prefs.getString(weatherUrl);
      return jsonDecode(results!);
    }
    var response = await http.get(Uri.parse(weatherUrl));
    var results = jsonDecode(response.body);
    await prefs.setString(weatherUrl, response.body);
    // print(results);
    return results;



    // final queryParams = {
    //   'key' : WEATHER_API_KEY,
    //   'q' : place
    // };
    // final weatherURL = Uri.http();
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // Options _cacheOptions = buildCacheOptions(const Duration(days: 2), forceRefresh: true);
    // _dio.interceptors.add(_dioCacheManager.interceptor);
    // // print("here");
    // final locationData = await LocationServices().getCity();
    // // print(locationData);
    // var response = await _dio.get(
    //   'https://api.weatherapi.com/v1/current.json?q=$locationData&key=$WEATHER_API_KEY', options: _cacheOptions
    // );
    // if (response.statusCode == 200) {
    //   // print(response.data);
    //   return response.data;
    // } else {
    //   throw Exception("Can not get weather");
    // }
  }
}
