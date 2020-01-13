import 'package:flutter/material.dart';
//[](https://api.flutter.dev/flutter/widgets/PhysicalModel-class.html)
/*
作用：裁剪子元素的形状

继承：Object Diagnosticable DiagnosticableTree Widget RenderObjectWidget SingleChildRenderObjectWidget PhysicalModel

构造函数：（类型 属性 = 默认值）

*/

class PhysicalModelPage extends StatelessWidget {
  const PhysicalModelPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PhysicalModel'),),
      body: PhysicalModel(
        elevation: 6.0,
        shape: BoxShape.circle,
        shadowColor: Colors.red,
        color: Colors.white,
        child: Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}