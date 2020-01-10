import "package:flutter/material.dart";

//[参考](https://juejin.im/post/5b4b31ee5188251a901877c4#heading-18)
/*
作用是调整child到固定的高度，将可能高度不受限制的child，调整到一个合适并且合理的尺寸。
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