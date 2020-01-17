//https://pub.flutter-io.cn/packages/english_words

import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';


class english_words_page extends StatefulWidget {
  english_words_page({Key key}) : super(key: key);

  @override
  _english_words_pageState createState() => _english_words_pageState();
}

class _english_words_pageState extends State<english_words_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('english_words'),),
      body: Column(children: <Widget>[
        InkWell(
          child: Text('生成随机字符串',style: TextStyle(fontSize: 18.0),),
          onTap: (){
            print(WordPair.random());
          },
        ),
        InkWell(
          child: Text('用英语打印前50个最常用的名词',style: TextStyle(fontSize: 18.0),),
          onTap: (){
            nouns.take(50).forEach(print);
          },
        ),
        InkWell(
          child: Text('计算单词中的音节数',style: TextStyle(fontSize: 18.0),),
          onTap: (){
            print(syllables('beautiful'));
          },
        ),
        InkWell(
          child: Text('生成5个有趣的2个音节的单词组合',style: TextStyle(fontSize: 18.0),),
          onTap: (){
            generateWordPairs().take(5).forEach(print);
          },
        ),
      ],),
    );
  }
}