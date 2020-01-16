import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/Draggable-class.html
//https://api.flutter.dev/flutter/widgets/LongPressDraggable-class.html

//https://api.flutter.dev/flutter/widgets/DragTarget-class.html
/*
作用：
  Draggable能够让您的小部件被用户拖拽
  并能获取拖拽的位置信息
  Positioned能够对根据偏移量offset进行定位
  而Draggable的child是它被拖动前的样子
  feedback是它被拖动时的样子，这里在颜色上加了opacity进行了区分
  而data是他在拖动到DragTarget将会传递的参数
  在DragTarget中，可以通过onAccept获取这个data

  这里在拖拽结束时会调用onDraggableCanceled，
  并传入被拖拽后的偏移量offset
  我们刷新这个offset就改变了Positioned的位置


继承: Object Diagnosticable DiagnosticableTree Widget StatefulWidget Draggable
      Object Diagnosticable DiagnosticableTree Widget StatefulWidget Draggable LongPressDraggable

构造函数：（类型 属性 = 默认值）
  const Draggable({
    Key key,
    @required this.child,
    @required this.feedback,
    this.data,
    this.axis,
    this.childWhenDragging,
    this.feedbackOffset = Offset.zero,
    this.dragAnchor = DragAnchor.child,
    this.affinity,
    this.maxSimultaneousDrags,
    this.onDragStarted,
    this.onDraggableCanceled,
    this.onDragEnd,
    this.onDragCompleted,
    this.ignoringFeedbackSemantics = true,
  })
*/

class DraggablePage extends StatefulWidget {
  @override
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  Color _draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Draggable'),),
      body: Stack(
        children: <Widget>[
          DraggableWidget(
            offset: Offset(100.0, 100.0),
            widgetColor: Colors.tealAccent,
          ),
          DraggableWidget(
            offset: Offset(200.0, 100.0),
            widgetColor: Colors.redAccent,
          ),
          Center(
            child: DragTarget(//拖动Widget时接收数据的Widget。
              onAccept: (Color color) {
                _draggableColor = color;
              }, 
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 200.0,
                  height: 200.0,
                  color: _draggableColor,
                );
              }
            ),
          )
        ],
      ),
    );
  }
}

class DraggableWidget extends StatefulWidget {

  final Offset offset;
  final Color widgetColor;

  const DraggableWidget({Key key, this.offset, this.widgetColor}) : super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: offset.dx,
        top: offset.dy,
        child: Draggable( //也可使用 LongPressDraggable 长按后拖动
          data: widget.widgetColor,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: widget.widgetColor,
          ),
          feedback: Container(
            width: 100.0,
            height: 100.0,
            color: widget.widgetColor.withOpacity(0.5),
          ),
          onDraggableCanceled: (Velocity velocity, Offset offset){
            setState(() {
              this.offset = offset;
            });
          },
        )
    );
  }
}