import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _bigFront = TextStyle(fontSize: 18.0);
  final _saved = Set<WordPair>();

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        textAlign: TextAlign.start,
        style:TextStyle(
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dashed,
          fontSize: 18.0,
          color: Colors.red,
        ),
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  Widget _buildSuggestion() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }


  void _pushSaved() {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) {
              final tiles = _saved.map(
                  (pair){
                    return ListTile(
                      title: new Text(
                          pair.asPascalCase,
                          style: _bigFront,
                      ),
                    );
                  },
              );
              final divided = ListTile
                .divideTiles(
                  context: context,
                  tiles: tiles,
                  )
              .toList();
              return Scaffold(
                appBar: AppBar(
                  title: Text("Saved Suggestions"),
                ),
                body: ListView(children: divided),
              );
            },
        ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('Startup Name Generator'),
//        actions: <Widget>[
//          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
//        ],
//      ),
//      body: _buildSuggestion(),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),

      ),
      body: Center(
        child: Container(
          child: Text("Hello New", style: TextStyle(fontSize: 24.0, color:Colors.black),),
          alignment: Alignment.topLeft,
          width: 500,
          height: 300,
//          color: Colors.blue,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.red,
                width: 10.0,
                style: BorderStyle.solid,
            ),
            gradient: LinearGradient(
              colors: [Colors.red,Colors.grey, Colors.blue],
            ),
          ),
        ),
      ),
    );
  }
}
