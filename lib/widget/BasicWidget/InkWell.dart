import 'package:flutter/material.dart';

//[](https://api.flutter.dev/flutter/material/InkWell-class.html)
/*
作用：添加点击事件

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget InkResponse InkWell

构造函数：（类型 属性 = 默认值）
  const InkWell({
    Key key,
    Widget child,
    GestureTapCallback onTap,
    GestureTapCallback onDoubleTap,
    GestureLongPressCallback onLongPress,
    GestureTapDownCallback onTapDown,
    GestureTapCancelCallback onTapCancel,
    ValueChanged<bool> onHighlightChanged,
    ValueChanged<bool> onHover,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    InteractiveInkFeatureFactory splashFactory,
    double radius,
    BorderRadius borderRadius,
    ShapeBorder customBorder,
    bool enableFeedback = true,
    bool excludeFromSemantics = false,
    FocusNode focusNode,
    bool canRequestFocus = true,
    ValueChanged<bool> onFocusChange,
    bool autofocus = false,
  })
*/


class InkWellPage extends StatefulWidget {
  InkWellPage({Key key}) : super(key: key);

  @override
  _InkWellPageState createState() => _InkWellPageState();
}

class _InkWellPageState extends State<InkWellPage> {
  double sideLength = 50;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InkWell'),),
      body: AnimatedContainer(
        height: sideLength,
        width: sideLength,
        duration: Duration(seconds: 2),
        curve: Curves.easeIn,
        child: Material(
          color: Colors.yellow,
          child: InkWell(
            onTap: () {
              setState(() {
                sideLength == 50 ? sideLength = 100 : sideLength = 50;
              });
            },
          ),
        ),
      ),
    );
  }
}