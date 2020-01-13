import 'package:flutter/material.dart';

//[](https://api.flutter.dev/flutter/material/Tooltip-class.html)
/*
作用：提示文本,当widget长时间按下时显示一个提示标签。

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget Tooltip

构造函数：（类型 属性 = 默认值）
  const Tooltip({
    Key key,
    @required this.message,
    this.height,
    this.padding,
    this.margin,
    this.verticalOffset,
    this.preferBelow,
    this.excludeFromSemantics,
    this.decoration,
    this.textStyle,
    this.waitDuration,
    this.showDuration,
    this.child,
  })
*/

class TooltipPage extends StatelessWidget {
  const TooltipPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tooltip'),),
      body: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Tooltip(
            message: 'High quality',
            child: IconButton(
              icon: Icon(Icons.high_quality),
              onPressed: () {
                /** */
              },
            ),
          ),
          Tooltip(
            message: 'Full screen',
            child: IconButton(
              icon: Icon(Icons.fullscreen),
              onPressed: () {
                /** */
              },
            ),
          ),
          Tooltip(
            message: 'Filter',
            child: IconButton(
              icon: Icon(Icons.filter),
              onPressed: () {
                /** */
              },
            ),
          )
        ],
      ),
    );
  }
}