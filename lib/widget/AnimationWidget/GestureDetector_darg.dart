import 'package:flutter/material.dart';

/*
拖动、滑动
GestureDetector对于拖动和滑动事件是没有区分的，他们本质上是一样的
*/


class GestureDetectorDargPage extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<GestureDetectorDargPage> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移

 double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('拖动'),),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text("按住拖动"),radius: 50.0,),
              //手指按下时会触发此回调
              onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${e.globalPosition}");
              },
              //手指滑动时会触发此回调
              onPanUpdate: (DragUpdateDetails e) {
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              //仅在垂直方向拖动
              /* onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              }, */
              onPanEnd: (DragEndDetails e){
                //打印滑动结束时在x、y轴上的速度
                print(e.velocity);
              },
            ),
          ),
        ],
      ),
    );
  }
}

