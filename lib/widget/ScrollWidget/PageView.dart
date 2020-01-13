import 'package:flutter/material.dart';

//[](https://api.flutter.dev/flutter/widgets/PageView-class.html)
/*
作用：整页滚动

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget PageView

构造函数：（类型 属性 = 默认值）

*/

class PageViewPage extends StatelessWidget {
  const PageViewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView'),),
      body: PageView(
  children: <Widget>[
    Container(
      color: Colors.pink,
      child: Center(
        child: Text('Page 1'),
      ),
    ),
    Container(
      color: Colors.cyan,
      child: Center(
        child: Text('Page 2'),
      ),
    ),
    Container(
      color: Colors.deepPurple,
      child: Center(
        child: Text('Page 3'),
      ),
    ),
  ],
),
    );
  }
}