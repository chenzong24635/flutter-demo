import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/SizeTransition-class.html
/*
作用：对自己的大小进行动画处理，然后裁剪并对齐其子级。

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget AnimatedWidget SizeTransition

构造函数：（类型 属性 = 默认值）

*/

class SizeTransitionPage extends StatefulWidget {
  @override
  SizeTransitionPageState createState() => SizeTransitionPageState();
}

class SizeTransitionPageState extends State<SizeTransitionPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..forward();

    return Scaffold(
      appBar: AppBar(
        title: Text('SizeTransition'),
      ),
      body: SizeTransition(
        axis: Axis.horizontal, //控制宽度或者高度缩放
        sizeFactor:new Tween(begin: 1.0, end: 0.5).animate(controller),
        child: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.red,
          child: Text('12345678'),
        )
      )
    );
  }
}
