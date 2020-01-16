import "package:flutter/material.dart";

// https://api.flutter.dev/flutter/widgets/IntrinsicHeight-class.html
/*
作用：将它的子widget的高度调整其本身实际的高度
但是应该尽量少用，因为其效率问题。


继承关系：
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > IntrinsicHeight
*/

class IntrinsicHeightPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IntrinsicHeight'),),
      body: IntrinsicHeight( // 去掉IntrinsicHeight，未设定高度的会 垂直铺满屏幕
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(color: Colors.blue, width: 100.0),
            Container(color: Colors.red, width: 50.0,height: 50.0,),
            Container(color: Colors.yellow, width: 150.0),
          ],
        ),
      ),
    );
  }
}