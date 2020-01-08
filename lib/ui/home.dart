import 'package:accumulate/ui/details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[_pageHeader(), _pageContent()],
              ),
            )
          ],
        ),
      );
    }));
  }

  _pageHeader() {
    return Builder(builder: (BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Articles",
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.9,
                color: Theme.of(context).accentColor),
          ),
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Card Tapped',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    duration: Duration(seconds: 2),
                  ));
                },
                child: Icon(
                  Icons.view_list,
                  color: Theme.of(context).accentColor,
                  size: 30.0,
                ),
              )
            ],
          ),
        ],
      );
    });
  }

  _pageContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15.0,
        ),
        _itemCard(),
        SizedBox(
          height: 10.0,
        ),
        _itemCard(),
        SizedBox(
          height: 10.0,
        ),
        _itemCard(),
        SizedBox(
          height: 10.0,
        ),
        _itemCard(),
        SizedBox(
          height: 10.0,
        ),
        _itemCard(),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }

  final String someText =
      "The RFC vote for spread operator support in Array expressions was overwhelmingly in favor of adding this feature to PHP 7.4";
  _itemCard() {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ArticleDetails()));
        },
        child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            shadowColor: Colors.grey[400],
            child: Stack(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://source.unsplash.com/1280x720/?technology,computers"),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken))),
              ),
              Positioned.fill(
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Spread Operator for Arrays Coming to PHP 7.4',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.75),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                letterSpacing: 0.9),
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
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          width: 30.0,
                                          decoration: BoxDecoration(
                                              color: Colors.teal,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.grey[400],
                                                  width: 1.5),
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
                      )))
            ])));
  }
}
