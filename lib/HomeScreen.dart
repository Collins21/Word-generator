import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:word_generator/Components.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appTitle(),
        elevation: 0.0,
        backgroundColor: Colors.white30,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  iconSize: 28,
                  icon: Icon(Icons.list),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      final Iterable<ListTile> tiles =
                          savedWordPairs.map((WordPair pair) {
                        return ListTile(title: Text(pair.asPascalCase));
                      });
                      final List<Widget> divided =
                          ListTile.divideTiles(context: context, tiles: tiles)
                              .toList();
                      return Scaffold(
                        appBar: AppBar(
                          title: appTitle(),
                          elevation: 0.0,
                          backgroundColor: Colors.white30,
                        ),
                        body: ListView(children: divided),
                      );
                    }));
                  })),
        ],
      ),
      body: Center(child: RandomWords()),
    );
  }
}
