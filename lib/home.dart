import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import 'package:hello_flutter/component/bottom_bar.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  void _showLoading(){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:(BuildContext context){
        return new Center(child:new CupertinoActivityIndicator(animating: true,radius: 30.0,) );
      }
    );
  }
  



  void _showIosDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: new Text('提示'),
            content: new Text('这是内容'),
          );
        });
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("确定"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  final List<WordPair> _suggestions = <WordPair>[];
  final WordPair wordPair = new WordPair.random();
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  Widget build(BuildContext context) {
    return new Container(
      // child: _buildSuggestions(),
      // child: new Center(child:new CupertinoActivityIndicator(animating: true,radius: 30.0,) )
      
      child: new RaisedButton(
        child: new Text('dialog'),
        onPressed: (){
          // _showDialog();
          // _showIosDialog();
          _showLoading();
        }
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(10.0),

        // 对于每个建议的单词对都会调用一次 itemBuilder，
        // 然后将单词对添加到 ListTile 行中
        // 在偶数行，该函数会为单词对添加一个 ListTile row.
        // 在奇数行，该行书湖添加一个分割线 widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。

        itemBuilder: (BuildContext _context, int i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) {
            return new Divider();
          }

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整）
          // 比如 i 为：1, 2, 3, 4, 5 时，结果为 0, 1, 1, 2, 2，
          // 这可以计算出 ListView 中减去分隔线后的实际单词对数量
          final int index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index], index);
        });
  }

  Widget _buildRow(WordPair pair, int i) {
    final bool alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase + '--' + i.toString(),
        style: _biggerFont,
      ),
      trailing: new Icon(alreadySaved ? Icons.favorite : Icons.face,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        print(_saved);
        // 增加如下 9 行代码...
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
}
