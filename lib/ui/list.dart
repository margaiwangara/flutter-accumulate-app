import 'package:flutter/material.dart';

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
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
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _pageHeader(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _pageBody(),
                ],
              ),
            )
          ],
        ),
      );
    }));
  }

  _pageHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }

  _pageBody() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 110.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://source.unsplash.com/1280x720/?programming,code'),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      repeat: ImageRepeat.noRepeat,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.35), BlendMode.darken),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
