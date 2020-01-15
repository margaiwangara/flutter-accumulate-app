import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ArticleResponse {
  final int count;
  final List<Article> data;

  ArticleResponse({this.count, this.data});

  factory ArticleResponse.fromJSON(Map<String, dynamic> json) {
    return ArticleResponse(data: json['data']);
  }
}

class Article {
  final int count;
  final String articleId;
  final String title;
  final String summary;
  final String content;
  final String datePublished;
  final String posterImage;
  final String articleLink;
  final List<Author> authors;
  final Language language;

  Article(
      {@required this.articleId,
      @required this.title,
      @required this.summary,
      @required this.content,
      @required this.articleLink,
      @required this.datePublished,
      @required this.posterImage,
      @required this.authors,
      this.count,
      this.language});

  factory Article.fromJSON(Map<String, dynamic> json) {
    return Article(
        count: json['count'],
        articleId: json['_id'],
        title: json['title'],
        summary: json['summary'],
        content: json['content'],
        articleLink: json['link'],
        posterImage: json['image'],
        datePublished: json['datePublished'],
        authors: json['authors'],
        language: json['language']);
  }
}

class Author {
  final String authorId;
  final String name;
  final String gravatar;

  Author({@required this.authorId, @required this.name, this.gravatar});
}

class Language {
  final String name;
  final String framework;

  Language({@required this.name, this.framework});
}

// fetch articles
Future<ArticleResponse> fetchArticle() async {
  final response =
      await http.get('https://devnewsbucket.margaiwangara.me/api/articles');

  if (response.statusCode == 200) {
    // if server response was successful parse json
    return ArticleResponse.fromJSON(json.decode(response.body));
  } else {
    throw Exception('Failed to load articles');
  }
}
