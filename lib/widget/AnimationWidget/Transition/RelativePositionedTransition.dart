import 'package:flutter/material.dart';

//
/*
作用：

继承：

构造函数：（类型 属性 = 默认值）

*/

class RelativePositionedTransitionPage extends StatefulWidget {
  RelativePositionedTransitionPage({Key key}) : super(key: key);

  @override
  _RelativePositionedTransitionPageState createState() => _RelativePositionedTransitionPageState();
}

class _RelativePositionedTransitionPageState extends State<RelativePositionedTransitionPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Text(''),
    );
  }
}