import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class Article {
  final String articleId;
  final String title;
  final String summary;
  final String content;
  final String datePublished;
  final String posterImage;
  final String articleLink;

  final List<Author> authors;
  // final Language language;

  Article({
    @required this.articleId,
    @required this.title,
    @required this.summary,
    @required this.content,
    @required this.articleLink,
    @required this.datePublished,
    @required this.posterImage,
    @required this.authors,
    // this.language,
  });

  factory Article.fromJSON(Map<String, dynamic> json) {
    var list = json['authors'] as List;
    print(list.runtimeType);

    List<Author> authorList = list.map((i) => Author.fromJSON(i)).toList();
    return Article(
        articleId: json['_id'],
        title: json['title'],
        summary: json['summary'],
        content: json['content'],
        articleLink: json['link'],
        posterImage: json['image'],
        datePublished: json['datePublished'],
        authors: authorList);
  }
}

class Author {
  final String authorId;
  final String name;
  final String gravatar;

  Author({@required this.authorId, @required this.name, this.gravatar});

  factory Author.fromJSON(Map<String, dynamic> json) {
    return Author(
        authorId: json['_id'], name: json['name'], gravatar: json['gravatar']);
  }
}

class Language {
  final String name;
  final String framework;

  Language({@required this.name, this.framework});
}

// fetch articles
Future<ResponseHandler> fetchArticle() async {
  final response = await http.get(
      'https://devnewsbucket.herokuapp.com/api/articles?sort=-datePublished');

  if (response.statusCode == 200) {
    // if server response was successful parse json
    return ResponseHandler.fromJSON(json.decode(response.body));
  } else {
    throw Exception('Failed to load articles');
  }
}
