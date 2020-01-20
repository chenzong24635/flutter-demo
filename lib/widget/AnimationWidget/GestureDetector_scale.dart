import 'package:flutter/material.dart';

/*
拖动、滑动
GestureDetector对于拖动和滑动事件是没有区分的，他们本质上是一样的
*/


class GestureDetectorScalePage extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<GestureDetectorScalePage> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移

 double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Center(
      child: GestureDetector(
          //指定宽度，高度自适应
          child: Image.asset("./images/a.jpg", width: _width),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              //缩放倍数在0.8到10倍之间
              _width=200*details.scale.clamp(.8, 10.0);
            });
          },
        ),
    ),
    );
  }
}

