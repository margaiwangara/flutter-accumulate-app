import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
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
    ));
  }

  _pageHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Articles",
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.9,
              color: Theme.of(context).primaryColor),
        ),
        Row(
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.view_list,
                color: Theme.of(context).primaryColor,
                size: 30.0,
              ),
            )
          ],
        ),
      ],
    );
  }

  _pageContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15.0,
        ),
        _itemCard()
      ],
    );
  }

  _itemCard() {
    return InkWell(
        onTap: () {},
        child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
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
                            Colors.black.withOpacity(0.2), BlendMode.darken))),
              ),
              Positioned.fill(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'I am the king of the world',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ))
            ])));
  }
}
