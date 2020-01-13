import 'package:flutter/material.dart';

//[](https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html)
/*
作用：一个可以嵌套其它可滚动widget的widget

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget NestedScrollView

构造函数：（类型 属性 = 默认值）

*/

class NestedScrollViewPage extends StatefulWidget {
  NestedScrollViewPage({Key key}) : super(key: key);

  @override
  _NestedScrollViewPageState createState() => _NestedScrollViewPageState();
}

class _NestedScrollViewPageState extends State<NestedScrollViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NestedScrollView'),),
      body: Text(''),
    );
  }
}

