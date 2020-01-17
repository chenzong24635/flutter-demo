import 'package:flutter/material.dart';

//
/*
作用：

继承：

构造函数：（类型 属性 = 默认值）

*/

class AnimatedPositionedPage extends StatefulWidget {
  AnimatedPositionedPage({Key key}) : super(key: key);

  @override
  _AnimatedPositionedPageState createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedPositioned'),),
      body: Text(''),
    );
  }
}