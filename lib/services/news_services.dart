import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:news_forecast/constants/newsapiurl.dart';
import 'package:news_forecast/constants/key.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsService {
  // late DioCacheManager _dioCacheManager;
  // //
  // final Dio _dio = Dio(
  //   BaseOptions(
  //     baseUrl: NewsApiUrl.baseUrl,
  //     responseType: ResponseType.json,
  //   ),
  // );

  fetchNews() async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // Options _cacheOptions =
    //     buildCacheOptions(const Duration(days: 7), forceRefresh: true);
    // _dio.interceptors.add(_dioCacheManager.interceptor);

    // var response = await _dio.get(
    //     'v2/top-headlines?apiKey=$API_KEY&category=technology&language=en',
    //     options: _cacheOptions);
    const newsApiUrl = "https://newsapi.org/v2/top-headlines?apiKey=$API_KEY&category=technology&language=en";
    // final cacheManager = DefaultCacheManager();
    // final file = await cacheManager.getSingleFile(newsApiUrl);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final connectivityResult = await (Connectivity().checkConnectivity());

    if(connectivityResult == ConnectivityResult.none){
      // final jsonString = cacheManager.getFileFromCache(newsApiUrl);
      final results = prefs.getString(newsApiUrl);
      return jsonDecode(results!);
    }
    var response = await http.get(Uri.parse(newsApiUrl));
    var results = jsonDecode(response.body);
    // await cacheManager.putFile(newsApiUrl, Uint8List.fromList(utf8.encode(jsonEncode(response.body))));
    await prefs.setString(newsApiUrl, response.body);
    print(results);
    return results;
  }

  // fetchNews() async {
  //   const key = 'https://newsapi.org/v2/top-headlines?apiKey=$API_KEY&category=technology&language=en';
  //   final cachedData = await DefaultCacheManager().getSingleFile(key);
  //   if (cachedData != null) {
  //     return json.decode(await cachedData.readAsString());
  //   }
  //
  //   final response = await Dio().get(
  //     'https://newsapi.org/v2/top-headlines?apiKey=$API_KEY&category=technology&language=en',
  //   );
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     await DefaultCacheManager().putFile(key, response.data);
  //     return response.data;
  //   }
  // }
}
