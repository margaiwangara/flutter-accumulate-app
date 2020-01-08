import 'package:flutter/material.dart';

class ArticleDetails extends StatefulWidget {
  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: ListView(
          children: <Widget>[_topSection()],
        ),
      ),
    );
  }

  _topSection() {
    return Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
            color: Colors.teal[50],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0)),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).accentColor.withOpacity(0.6),
                  offset: new Offset(-0.75, 5.0),
                  blurRadius: 5.5)
            ],
            image: DecorationImage(
                image: NetworkImage("https://picsum.photos/1280?image=8"),
                fit: BoxFit.cover,
                alignment: Alignment.center,
                repeat: ImageRepeat.noRepeat,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.darken))),
      )
    ]);
  }
}
