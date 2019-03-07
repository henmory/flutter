import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget rating = Container(
      padding: EdgeInsets.all(5.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Icon(
            Icons.star,
            color: Colors.black,
          ),
          Icon(
            Icons.star,
            color: Colors.black,
          ),
          Icon(
            Icons.star,
            color: Colors.black,
          ),
          Icon(
            Icons.star,
            color: Colors.black,
          ),
          Icon(
            Icons.star,
            color: Colors.black,
          ),
        ]),
        Text(
          '170 Reviews',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
      ]),
    );
    Widget item(IconData icon, description, time) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(icon, color: Colors.green,),
            Container(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(description),
            ),
            Container(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(time),
            ),
          ]);
    }

    Widget details = Container(
      padding: EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          item(Icons.kitchen, "PREP", "25 min"),
          item(Icons.timer, "COOK", "1 hr"),
          item(Icons.restaurant, "FEEDS", "4-6"),
        ],
      ),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: Column(
          children: <Widget>[rating, details],
        ),
      ),
    );
  }
}
