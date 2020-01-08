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
              children: <Widget>[_pageHeader()],
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
        )
      ],
    );
  }
}
