import 'package:flutter/material.dart';

//
/*
作用：

继承：

构造函数：（类型 属性 = 默认值）

*/

class AnimatedWidgetBaseStatePage extends StatefulWidget {
  AnimatedWidgetBaseStatePage({Key key}) : super(key: key);

  @override
  _AnimatedWidgetBaseStatePageState createState() => _AnimatedWidgetBaseStatePageState();
}

class _AnimatedWidgetBaseStatePageState extends State<AnimatedWidgetBaseStatePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedWidgetBaseState'),),
      body: Text(''),
    );
  }
}