import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/PositionedTransition-class.html
/*
作用：Positioned的动画版本
PositionedTransition 必须作为Stack 控件的子View，否则就会报错。

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget AnimatedWidget PositionedTransition

构造函数：（类型 属性 = 默认值）
  const PositionedTransition({
    Key key,
    @required Animation<RelativeRect> rect, 规定子widget 离 Stack边距的值
    @required this.child,
  }) 
*/

class PositionedTransitionPage extends StatefulWidget {
  PositionedTransitionPage({Key key}) : super(key: key);

  @override
  _PositionedTransitionPageState createState() =>
      _PositionedTransitionPageState();
}

class _PositionedTransitionPageState extends State<PositionedTransitionPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Animatable animatable = RelativeRectTween(
      begin: new RelativeRect.fromLTRB(75.0, 75, 75, 75.0),
      end: new RelativeRect.fromLTRB(100.0, 100.0, 100.0, 100.0),
    );

    Animation frontRelativeRect = animatable.animate(new AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat());

    return Scaffold(
      appBar: AppBar(
        title: Text('PositionedTransition'),
      ),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        children: <Widget>[
          Container(width: 200, height: 200, color: Colors.blue),
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          PositionedTransition(
            rect: frontRelativeRect,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.orange,
            ),
          )
        ],
      ),
    );
  }
}
