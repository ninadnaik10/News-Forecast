import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_forecast/main.dart';
import 'package:news_forecast/widgets/news_card.dart';

import '../models/news_model.dart';
import '../providers/news_provider.dart';

class NewsPage extends ConsumerWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NewsModel news = ref.watch(newsProvider).newsModel;
    bool isLoading = ref.watch(newsProvider).isLoading;

    return SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (BuildContext context, int index) => NewsCard(
                      article: news.articles![index],
                      newsNumber: index,
                    ),
                itemCount: news.articles!.length));
  }
}
