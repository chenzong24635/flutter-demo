import 'package:flutter/material.dart';

//[](https://api.flutter.dev/flutter/material/SelectableText-class.html)
/*
作用：可选文本

继承：

构造函数：（类型 属性 = 默认值）
  const SelectableText(
    this.data, {
    Key key,
    this.focusNode,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.showCursor = false,
    this.autofocus = false,
    ToolbarOptions toolbarOptions,
    this.maxLines,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.onTap,
    this.scrollPhysics,
    this.textWidthBasis,
  })
*/

class SelectableTextPage extends StatelessWidget {
  const SelectableTextPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SelectableText(
        'Hello! How are you?',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      SelectableText.rich(
        TextSpan(
          text: 'Hello', // default text style
          children: <TextSpan>[
            TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
            TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ],);
  }
}