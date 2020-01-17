import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/AnimatedModalBarrier-class.html
/*
作用：防止用户与其自身背后的小部件进行交互，并且可以使用动画颜色值进行配置。

继承：

构造函数：（类型 属性 = 默认值）

*/

class AnimatedModalBarrierPage extends StatefulWidget {
  AnimatedModalBarrierPage({Key key}) : super(key: key);

  @override
  _AnimatedModalBarrierPageState createState() => _AnimatedModalBarrierPageState();
}

class _AnimatedModalBarrierPageState extends State<AnimatedModalBarrierPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Text(''),
    );
  }
}