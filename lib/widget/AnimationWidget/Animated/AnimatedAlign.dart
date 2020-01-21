//https://api.flutter.dev/flutter/widgets/AnimatedAlign-class.html
/*
作用：Align的动画

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget ImplicitlyAnimatedWidget AnimatedAlign

构造函数：（类型 属性 = 默认值）
  const AnimatedAlign({
    Key key,
    @required this.alignment,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
    VoidCallback onEnd,
  })
*/

import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  AnimatedAlignPage({Key key}) : super(key: key);

  @override
  _AnimatedAlignPageState createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  Alignment _algin = Alignment.bottomLeft;

  void _change() {
    setState(() => _algin = Alignment.topRight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedAlign'),),
      body: Column(children: <Widget>[
        SizedBox(
          height: 200.0,
          child: AnimatedAlign(
            duration: Duration(seconds: 3),
            alignment: _algin,
            child: FlutterLogo(size:50.0),
            onEnd: (){
              setState(() => _algin = Alignment.topCenter);
            },
          ),
        ),
        RaisedButton(
          child: Text('移动'),
          onPressed: (){
            _change();
          },
        )
      ],),
    );
  }
}