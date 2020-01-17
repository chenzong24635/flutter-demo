import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html
/*
作用：不透明度的动画版本

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget ImplicitlyAnimatedWidget AnimatedOpacity

构造函数：（类型 属性 = 默认值）
  const AnimatedOpacity({
    Key key,
    this.child,
    @required this.opacity,
    Curve curve = Curves.linear,
    @required Duration duration,
    VoidCallback onEnd,
    this.alwaysIncludeSemantics = false,
  }) 
*/

class AnimatedOpacityPage extends StatefulWidget {
  AnimatedOpacityPage({Key key}) : super(key: key);

  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> with SingleTickerProviderStateMixin {
  double _opacity = 1.0;

  void _changeOpacity() {
    setState(() => _opacity = _opacity == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedOpacity'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: 3),
            child: FlutterLogo(size:50.0),
          ),
          RaisedButton(
            child: Text('Fade Logo'),
            onPressed: _changeOpacity,
          ),
        ],
      ),
    );
  }
}