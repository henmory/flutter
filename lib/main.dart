import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget title = Container(
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    "Oeschinen Lake Campground",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Kandersteg, Switzerland",
                    style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text("41"),
          ),
        ],
      ),
    );
    Widget button = Container(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          item(Icons.call, "CALL"),
          item(Icons.near_me, "ROUTER"),
          item(Icons.share, "SHARE"),
        ],
      ),
    );
    Widget text = Container(
        padding: EdgeInsets.only(left: 32.0, right: 32.0),
        child:Text(
          '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes.A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.''',
        ),
    );
    return MaterialApp(
      title: "demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/photo.jpeg',
              fit: BoxFit.cover,
            ),
            title,
            button,
            text,
          ],
        ),
      ),
    );
  }

  Widget item(IconData icon, String data) {
    Color color = Colors.blue;
    return Column(

      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          data,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
