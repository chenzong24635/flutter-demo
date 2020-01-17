import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/AnimatedPhysicalModel-class.html
/*
作用：PhysicalModel的动画版本

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget ImplicitlyAnimatedWidget AnimatedPhysicalModel

构造函数：（类型 属性 = 默认值）

*/

class AnimatedPhysicalModelPage extends StatefulWidget {
  AnimatedPhysicalModelPage({Key key}) : super(key: key);

  @override
  _AnimatedPhysicalModelPageState createState() => _AnimatedPhysicalModelPageState();
}

class _AnimatedPhysicalModelPageState extends State<AnimatedPhysicalModelPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedPhysicalModel'),),
      body: Text(''),
    );
  }
}