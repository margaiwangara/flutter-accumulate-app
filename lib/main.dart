import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wakelock/wakelock.dart';
// import 'package:accumulate/ui/home.dart';
// import 'dart:developer';

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
  Future<ResponseHandler> article;

  @override
  void initState() {
    super.initState();
    article = fetchArticle();
    print(article);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: article,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              for (var a in snapshot.data.data) {
                print(a.title);
              }
              // print(snapshot.data.data[1].title);
              return Text('This is my text');
            } else {
              return Text("${snapshot.error}");
            }
          },
        ),
      ),
    );
  }
}
