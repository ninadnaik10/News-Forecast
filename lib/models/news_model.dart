// class NewsModel {
//   String? status;
//   int? totalResults;
//   List<Results>? results;
//   String? nextPage;
//
//   NewsModel({this.status, this.totalResults, this.results, this.nextPage});
//
//   NewsModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     totalResults = json['totalResults'];
//     if (json['results'] != null) {
//       results = <Results>[];
//       json['results'].forEach((v) {
//         results!.add(new Results.fromJson(v));
//       });
//     }
//     nextPage = json['nextPage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['totalResults'] = this.totalResults;
//     if (this.results != null) {
//       data['results'] = this.results!.map((v) => v.toJson()).toList();
//     }
//     data['nextPage'] = this.nextPage;
//     return data;
//   }
// }
//
// class Results {
//   String? title;
//   String? link;
//   List<String>? keywords;
//   List<String>? creator;
//   Null? videoUrl;
//   String? description;
//   String? content;
//   String? pubDate;
//   String? imageUrl;
//   String? sourceId;
//   List<String>? category;
//   List<String>? country;
//   String? language;
//
//   Results(
//       {this.title,
//         this.link,
//         this.keywords,
//         this.creator,
//         this.videoUrl,
//         this.description,
//         this.content,
//         this.pubDate,
//         this.imageUrl,
//         this.sourceId,
//         this.category,
//         this.country,
//         this.language});
//
//   Results.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     link = json['link'];
//     // keywords = json['keywords'].cast<String>();
//     // creator = json['creator'].cast<String>();
//     videoUrl = json['video_url'];
//     description = json['description'];
//     content = json['content'];
//     pubDate = json['pubDate'];
//     imageUrl = json['image_url'];
//     sourceId = json['source_id'];
//     category = json['category'].cast<String>();
//     country = json['country'].cast<String>();
//     language = json['language'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['link'] = this.link;
//     data['keywords'] = this.keywords;
//     data['creator'] = this.creator;
//     data['video_url'] = this.videoUrl;
//     data['description'] = this.description;
//     data['content'] = this.content;
//     data['pubDate'] = this.pubDate;
//     data['image_url'] = this.imageUrl;
//     data['source_id'] = this.sourceId;
//     data['category'] = this.category;
//     data['country'] = this.country;
//     data['language'] = this.language;
//     return data;
//   }
// }





class NewsModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source =
        json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
