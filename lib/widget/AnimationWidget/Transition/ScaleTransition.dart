import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/ScaleTransition-class.html
/*
作用： 缩放动画

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget AnimatedWidget ScaleTransition

构造函数：（类型 属性 = 默认值）
  const ScaleTransition({
    Key key,
    @required Animation<double> scale,
    this.alignment = Alignment.center,
    this.child,
  }) 
*/

class ScaleTransitionPage extends StatefulWidget {
  ScaleTransitionPage({Key key}) : super(key: key);

  @override
  _ScaleTransitionPageState createState() => _ScaleTransitionPageState();
}

class _ScaleTransitionPageState extends State<ScaleTransitionPage> with SingleTickerProviderStateMixin  {

  @override
  Widget build(BuildContext context) {
    Animation<double> _controller =
          Tween(begin: 1.0, end: 0.0).animate(AnimationController(
        duration: Duration(seconds: 3),
        vsync: this,
      )..forward());

    return Scaffold(
      appBar: AppBar(title: Text('ScaleTransition'),),
      body: ScaleTransition(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.orange,
      ),
      scale: _controller,
    ),
    );
  }
}