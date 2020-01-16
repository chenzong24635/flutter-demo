import 'package:flutter/material.dart';


//https://api.flutter.dev/flutter/widgets/GestureDetector-class.html
/*
作用：检测手势

继承：Object Diagnosticable DiagnosticableTree Widget StatelessWidget GestureDetector

构造函数：（类型 属性 = 默认值）
  GestureDetector({
    Key key,
    this.child,
    this.onTapDown,
    this.onTapUp,
    this.onTap,
    this.onTapCancel, //取消按下（按住移开）
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onDoubleTap, //双击
    this.onLongPress, //长按
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressUp, //长按后松开
    this.onLongPressEnd,
    this.onVerticalDragDown,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onVerticalDragCancel,
    this.onHorizontalDragDown,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    this.onHorizontalDragCancel,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
    this.behavior, //手势 在hit testing中的表现。
    this.excludeFromSemantics = false,
    this.dragStartBehavior = DragStartBehavior.start,
  }) 
*/

class GestureDetectorPage extends StatefulWidget {
  GestureDetectorPage({Key key}) : super(key: key);

  @override
  _GestureDetectorPageState createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  bool _lights = false;
  String _behavior;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GestureDetector'),),
      body: Container(
        alignment: FractionalOffset.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('手势：$_behavior',style: TextStyle(fontSize: 22.0),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.lightbulb_outline,
                color: _lights ? Colors.yellow.shade600 : Colors.black,
                size: 60,
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  _lights = !_lights;
                  _behavior = 'onTap';
                });
              },
              onTapCancel: () { //按住移开
                setState(() {
                  _behavior = 'onTapCancel';
                });
              },
              onDoubleTap: (){
                setState(() {
                  _behavior = 'onDoubleTap';
                });
              },
              onLongPress: (){
                setState(() {
                  _behavior = 'onLongPress';
                });
              },
              onLongPressUp: (){
                setState(() {
                  _behavior = 'onLongPressUp';
                });
              },
              child: Container(
                color: Colors.yellow.shade600,
                padding: const EdgeInsets.all(8),
                child: const Text('TURN LIGHTS ON'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}