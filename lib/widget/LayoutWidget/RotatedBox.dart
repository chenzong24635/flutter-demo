import 'package:flutter/material.dart';

//[](https://api.flutter.dev/flutter/widgets/RotatedBox-class.html)
/*
作用：旋转组件

继承：Object Diagnosticable DiagnosticableTree Widget RenderObjectWidget SingleChildRenderObjectWidget RotatedBox

构造函数：（类型 属性 = 默认值）

*/

class RotatedBoxPage extends StatelessWidget {
  const RotatedBoxPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RotatedBox'),),
      body: RotatedBox(
        quarterTurns: 3,
        child: const Text('Hello World!'),
      ),
    );
  }
}