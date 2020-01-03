import "package:flutter/material.dart";

//[参考]()
//[参考](https://api.flutter.dev/flutter/widgets/LimitedBox-class.html)
/*
作用：将child限制在其设定的最大宽高中的，但是这个限定是有条件的。当LimitedBox最大宽度不受限制时，child的宽度就会受到这个最大宽度的限制，同理高度。

继承关系：Object Diagnosticable DiagnosticableTree Widget RenderObjectWidget SingleChildRenderObjectWidget LimitedBox

LimitedBox({
  Key key,
  this.maxWidth = double.infinity, // 限定的最大宽度，默认值是double.infinity，不能为负数。
  this.maxHeight = double.infinity,// 限定的最大高度，默认值是double.infinity，不能为负数。
  Widget child,
})
*/

class LimitedBoxPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LimitedBox'),),
      body: Container(
        color: Colors.amber,
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Container(
              color: Colors.red,
              width: 30.0,
            ),
            LimitedBox(
              maxWidth: 150.0,
              child: Container(
                color: Colors.blue,
                width: 250.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}