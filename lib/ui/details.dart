import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as Lipsum;

class ArticleDetails extends StatefulWidget {
  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  final String sampleText =
      Lipsum.createParagraph(numParagraphs: 3, numSentences: 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[_topSection(), _bottomSection()],
        ),
      ),
    );
  }

  _topSection() {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
              color: Colors.teal[50],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.6),
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
        ),
        Positioned.fill(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[_topSectionHeader(), _topSectionFooter()],
                )))
      ],
    );
  }

  _topSectionHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.chevron_left,
                    size: 25.0,
                    color: Colors.grey[400],
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.9),
                  )
                ],
              ))
        ],
      ),
    );
  }

  _topSectionFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Text(
            "php > laravel".toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
              letterSpacing: 0.9,
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'Spread Operator for Arrays Coming to PHP 7.4',
          style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 0.9,
              color: Colors.white.withOpacity(0.75),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                height: 30.0,
                child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Container(
                    width: 30.0,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[400], width: 1.5),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://source.unsplash.com/300x300/?people"),
                            fit: BoxFit.cover,
                            alignment: Alignment.center)),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Jane Doe',
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.9))
                ])),
            Text(
              "2 Days Ago",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.9),
            )
          ],
        )
      ],
    );
  }

  _bottomSection() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Text(
          sampleText,
          style: TextStyle(
              fontSize: 17.5,
              color: Colors.white.withOpacity(0.75),
              height: 1.5),
        ));
  }
}
