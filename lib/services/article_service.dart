import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:accumulate/model/article.dart';

final String baseURI = "https://devnewsbucket.margaiwangara.me/api";

class ResponseHandler {
  final int count;
  final List<Article> data;

  ResponseHandler({this.count, this.data});

  factory ResponseHandler.fromJSON(Map<String, dynamic> json) {
    var list = json['data'] as List;
    print(list.runtimeType);

    List<Article> articleList = list.map((i) => Article.fromJSON(i)).toList();

    return ResponseHandler(count: json['count'], data: articleList);
  }
}

Future<http.Response> _loadResponse(uri) async => await http.get(uri);

Future<ResponseHandler> fetchArticles(String params) async {
  final String articlesURI = "$baseURI/articles?$params";
  final response = await _loadResponse(articlesURI);

  if (response.statusCode == 200) {
    // if server response was successful parse json
    return ResponseHandler.fromJSON(json.decode(response.body));
  } else {
    throw Exception("Failed to load articles");
  }
}

Future<Article> fetchArticle(String articleLink) async {
  final String articleURI = "$baseURI/articles/$articleLink";
  final response = await http.get(articleURI);

  if (response.statusCode == 200) {
    return Article.fromJSON(json.decode(response.body));
  } else {
    throw Exception("Failed to load article");
  }
}
