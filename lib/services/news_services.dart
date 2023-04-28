import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:weather_news_app/constants/newsapiurl.dart';
import 'package:weather_news_app/constants/key.dart';

class NewsService{

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: NewsApiUrl.baseUrl,
      responseType: ResponseType.json,
    ),
  );

  fetchNews() async {
    var response = await _dio.get('v2/top-headlines?apiKey=$API_KEY&category=technology&language=en');

    return response.data;
  }

}