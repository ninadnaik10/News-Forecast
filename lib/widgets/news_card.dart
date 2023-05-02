import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_news_app/models/news_model.dart';
import 'package:weather_news_app/main.dart';

import '../constants/newsapiurl.dart';

class NewsCard extends StatelessWidget {
  final Articles article;
  var newsNumber;
  NewsCard({Key? key, required this.article, this.newsNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? finalContent = article.content?.replaceAll(RegExp(r"\[\+.*"), "Read more");
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: InkWell(
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: newsNumber,
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage == null
                        ? NewsApiUrl.imageNotFound
                        : article.urlToImage.toString(),
                    errorWidget: (context, string, _) {
                      return const Icon(Icons.error);
                    },
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Text(
                article.title.toString(),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (BuildContext context) {
            SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                // systemNavigationBarDividerColor: lightColorScheme.pri,//Navigation bar divider color
                // systemNavigationBarIconBrightness: Brightness.light,
                ));
            return Scaffold(
              floatingActionButton: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    _launchInBrowser(Uri.parse(article.url ?? "null"));
                  },
                  label: const Text("Visit"),
                  icon: const Icon(Icons.open_in_browser_rounded),
                ),
              ),
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
                backgroundColor: Colors.transparent,
                // backgroundColor: const Color(0x44000000),
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Wrap(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: SizedBox(
                        height: 250,
                        child: Hero(
                          transitionOnUserGestures: true,
                          tag: newsNumber,
                          child: CachedNetworkImage(
                            imageUrl: article.urlToImage == null
                                ? NewsApiUrl.imageNotFound
                                : article.urlToImage.toString(),
                            errorWidget: (context, string, _) {
                              return const Icon(Icons.error);
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Text(
                            article.title ?? "No text available",
                            style: GoogleFonts.openSans(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 20.0)),
                          Text(
                            article.description ?? "No text available..Read More",
                            style: GoogleFonts.openSans(fontSize: 20),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 20.0)),
                          Text(
                            finalContent ?? "No content available",
                            style: GoogleFonts.openSans(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }));
        },
      ),
    );
  }
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
