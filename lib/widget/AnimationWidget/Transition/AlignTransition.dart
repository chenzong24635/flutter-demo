import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/AlignTransition-class.html
/*
作用：Align的过渡

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget AnimatedWidget AlignTransition

构造函数：（类型 属性 = 默认值）
  const AlignTransition({
    Key key,
    @required Animation<AlignmentGeometry> alignment,
    @required this.child,
    this.widthFactor,
    this.heightFactor,
  }) 
*/

class AlignTransitionPage extends StatefulWidget {
  AlignTransitionPage({Key key}) : super(key: key);

  @override
  _AlignTransitionPageState createState() => _AlignTransitionPageState();
}

class _AlignTransitionPageState extends State<AlignTransitionPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Text(''),
    );
  }
}