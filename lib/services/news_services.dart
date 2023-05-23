import 'package:dio/dio.dart';
import 'package:news_forecast/constants/newsapiurl.dart';
import 'package:news_forecast/constants/key.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class NewsService {
  late DioCacheManager _dioCacheManager;
  //
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: NewsApiUrl.baseUrl,
      responseType: ResponseType.json,
    ),
  );

  fetchNews() async {
    _dioCacheManager = DioCacheManager(CacheConfig());
    Options _cacheOptions =
        buildCacheOptions(const Duration(days: 7), forceRefresh: true);
    _dio.interceptors.add(_dioCacheManager.interceptor);

    var response = await _dio.get(
        'v2/top-headlines?apiKey=$API_KEY&category=technology&language=en',
        options: _cacheOptions);

    return response.data;
  }

  // fetchNews() async {
  //   const key = 'https://newsapi.org/v2/top-headlines?apiKey=$API_KEY&category=technology&language=en';
  //   print("helwifjwreh");
  //   final cachedData = await DefaultCacheManager().getSingleFile(key);
  //   print("helwifjwreh");
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
