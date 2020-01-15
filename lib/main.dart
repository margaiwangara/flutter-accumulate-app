import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wakelock/wakelock.dart';
import 'package:accumulate/ui/home.dart';
import 'dart:developer';

// sample code
import 'package:accumulate/model/article.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    // apptheme

    final ThemeData appTheme = ThemeData(
        primaryColor: Color(0xFF443742),
        accentColor: Color(0xFFCEA07E),
        textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme));
    return MaterialApp(
      title: "Accumulate",
      theme: appTheme,
      home: ArticleApp(),
    );
  }
}

class ArticleApp extends StatefulWidget {
  @override
  _ArticleAppState createState() => _ArticleAppState();
}

class _ArticleAppState extends State<ArticleApp> {
  Future<ArticleResponse> article;

  @override
  void initState() {
    super.initState();
    article = fetchArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<ArticleResponse>(
            future: article,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                log("Count: ${snapshot.data.data}");
                return Text("${snapshot.data.data}");
              } else {
                return Text("${snapshot.error}");
              }
            }),
      ),
    );
  }
}
