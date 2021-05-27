import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

Widget appTitle() {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text(
      'Word',
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
    ),
    Text(
      'Generator',
      style: TextStyle(
        color: Colors.blue,
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
    )
  ]);
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

final _words = <WordPair>[];
final savedWordPairs = Set<WordPair>();

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _words.length) {
          _words.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_words[index]);
      },
      padding: EdgeInsets.symmetric(horizontal: 10),
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = savedWordPairs.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            savedWordPairs.remove(pair);
          } else {
            savedWordPairs.add(pair);
          }
        });
      },
    );
  }
}
