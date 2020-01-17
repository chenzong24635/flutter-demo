import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/FadeTransition-class.html
/*
作用：淡入淡出动画。opacity 属性需要指定一个Animation<double>，child属性指定widget。

继承：Object Diagnosticable DiagnosticableTree Widget RenderObjectWidget SingleChildRenderObjectWidget FadeTransition

构造函数：（类型 属性 = 默认值）
  const FadeTransition({
    Key key,
    @required this.opacity,
    this.alwaysIncludeSemantics = false,
    Widget child,
  })
*/

class FadeTransitionPage extends StatefulWidget {
  FadeTransitionPage({Key key}) : super(key: key);

  @override
  _FadeTransitionPageState createState() => _FadeTransitionPageState();
}

class _FadeTransitionPageState extends State<FadeTransitionPage> with SingleTickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {

    AnimationController _controll = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();

    return Scaffold(
      appBar: AppBar(title: Text('FadeTransition'),),
      body: FadeTransition(
          opacity: _controll,
          child: FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
          alwaysIncludeSemantics: true,
        ),
    );
  }
}