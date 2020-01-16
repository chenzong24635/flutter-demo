import "package:flutter/material.dart";

//https://api.flutter.dev/flutter/widgets/IntrinsicWidth-class.html
/*
作用：将它的子widget的宽度调整其本身实际的宽度，会存在效率问题，能别使用就尽量别使用。

继承关系：
Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > IntrinsicWidth

构造函数：
const IntrinsicWidth({ 
  Key key, 
  this.stepWidth, 
  this.stepHeight, 
  Widget child 
})

IntrinsicWidth不同于IntrinsicHeight，它包含了额外的两个参数，stepHeight以及stepWidth。而IntrinsicWidth的布局行为跟这两个参数相关。
  当stepWidth不是null的时候，child的宽度将会是stepWidth的倍数，当stepWidth值比child最小宽度小的时候，这个值不起作用；
  当stepWidth为null的时候，child的宽度是child的最小宽度；
  当stepHeight不为null的时候，效果跟stepWidth相同；
  当stepHeight为null的时候，高度取最大高度。
*/

class IntrinsicWidthPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IntrinsicWidth'),),
      body: Container(
        color: Colors.green,
        padding: const EdgeInsets.all(5.0),
        child: new IntrinsicWidth( //去掉IntrinsicWidth，未设定宽度的会 水平铺满屏幕
          stepHeight: 450.0,
          stepWidth: 300.0,
          child: new Column(
            children: <Widget>[
              new Container(color: Colors.blue, height: 100.0),
              new Container(color: Colors.red, width: 150.0, height: 100.0),
              new Container(color: Colors.yellow, height: 150.0,),
            ],
          ),
        ),
      ),
    );
  }
}