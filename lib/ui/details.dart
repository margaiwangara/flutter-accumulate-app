import 'package:flutter/material.dart';

class ArticleDetails extends StatefulWidget {
  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Second Route. Go Back To First'),
      ),
    );
  }
}
