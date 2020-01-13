import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

// https://www.jianshu.com/p/bc9fbfab70df
//https://flutterchina.club/widgets/animation/

//[](https://api.flutter.dev/flutter/widgets/RotationTransition-class.html)
/*
作用：旋转动画

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget AnimatedWidget RotationTransition

构造函数：（类型 属性 = 默认值）

*/

class RotationTransitionPage extends StatefulWidget {
  RotationTransitionPage({Key key}) : super(key: key);

  @override
  _RotationTransitionPageState createState() => _RotationTransitionPageState();
}

class _RotationTransitionPageState extends State<RotationTransitionPage> with SingleTickerProviderStateMixin{
  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 3,
  );

  AnimationController _controller;

  bool _first = true;

  initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RotationTransition(
          turns: turnsTween.animate(_controller),
          child: Container(
            child: Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.all(20),
              child: FlutterLogo(),
            ),
          ),
        ),
        SizedBox(height: 20,),
        FlatButton(
          onPressed: () {
            if (_first) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
            _first = !_first;
          },
          child: Text(
            "Click Me!",
          ),
        )
      ],
    );
  }
}