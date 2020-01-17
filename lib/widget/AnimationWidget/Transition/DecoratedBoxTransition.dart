import 'package:flutter/material.dart';

//
/*
作用：DecoratedBox的过渡动画，可对其装饰的不同属性进行动画处理

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget AnimatedWidget DecoratedBoxTransition

构造函数：（类型 属性 = 默认值）
  const DecoratedBoxTransition({
    Key key,
    @required this.decoration,
    this.position = DecorationPosition.background,
    @required this.child,
  }) 
*/

class DecoratedBoxTransitionPage extends StatefulWidget {
  @override
  DecoratedBoxTransitionPageState createState() => DecoratedBoxTransitionPageState();
}

class DecoratedBoxTransitionPageState extends State<DecoratedBoxTransitionPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..forward();

    Animation<Decoration> _decoration = decorationTween.animate(_controller);

    return Scaffold(
      appBar: AppBar(
        title: Text('DecoratedBoxTransition'),
      ),
      body: new DecoratedBoxTransition(
        decoration: _decoration,
        position: DecorationPosition.background,
        child: new Container(
          width: 200,
          height: 200,
        )
      ),
    );
  }
}

DecorationTween decorationTween = DecorationTween(
  begin: BoxDecoration(
    color: Colors.blue, //子widget背景颜色
    border: Border.all(
      color: Colors.blue, //边界颜色
      style: BorderStyle.solid,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20)),
    shape: BoxShape.rectangle,
    boxShadow: const <BoxShadow>[
      BoxShadow(
        color: Colors.amberAccent,
        blurRadius: 5.0,
        spreadRadius: 5.0,
      )
    ],
  ),
  end: BoxDecoration(
    color: Colors.green,
    border: Border.all(
      color: Colors.green,
      style: BorderStyle.solid,
      width: 1.0,
    ),
    shape: BoxShape.rectangle,
    boxShadow: const <BoxShadow>[
      BoxShadow(
        color: Colors.blueGrey,
        blurRadius: 5.0,
        spreadRadius: 5.0,
      )
    ],
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
);