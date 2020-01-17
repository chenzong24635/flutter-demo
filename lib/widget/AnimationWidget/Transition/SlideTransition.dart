import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/SlideTransition-class.html
/*
作用：移动过渡动画
SlideTransition 动画最重要的属性是position和child。position是Animation<Offset>。可以通过Tween.animate 生成。

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget AnimatedWidget SlideTransition

构造函数：（类型 属性 = 默认值）
  const SlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.textDirection,
    this.child,
  }) 
*/

class SlideTransitionPage extends StatefulWidget {
  SlideTransitionPage({Key key}) : super(key: key);

  @override
  _SlideTransitionPageState createState() => _SlideTransitionPageState();
}

class _SlideTransitionPageState extends State<SlideTransitionPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var t = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
      end: const Offset(0.0, 1.0),
    ).animate(AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..forward());

    return Scaffold(
      appBar: AppBar(title: Text('SlideTransition'),),
      body: SlideTransition(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.orange,
        ),
        position: t,
      ),
    );
  }
}