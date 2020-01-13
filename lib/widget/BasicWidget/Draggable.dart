import 'package:flutter/material.dart';

//[](https://api.flutter.dev/flutter/widgets/Draggable-class.html)
/*
作用：可拖动widget

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget Draggable

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
  DraggablePage({Key key}) : super(key: key);

  @override
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Draggable'),),
      body: Draggable(
        child: Text('AAAA'),
        feedback:Text('BBB'),
      ),
    );
  }
}