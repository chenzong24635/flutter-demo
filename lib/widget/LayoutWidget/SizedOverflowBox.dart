import "package:flutter/material.dart";

//[参考](https://docs.flutter.io/flutter/widgets/SizedOverflowBox-class.html)
/*
作用：SizedBox与OverflowBox的结合体

继承关系：Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > SizedOverflowBox

构造函数：
SizedOverflowBox({
  Key key,
  @required this.size, // 固定的尺寸
  this.alignment = Alignment.center,
  Widget child,
})
*/

class SizedOverflowBoxPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SizedOverflowBox'),),
      body: Container(
        color: Colors.green,
        alignment: Alignment.topRight,
        width: 200.0,
        height: 200.0,
        padding: EdgeInsets.all(5.0),
        child: SizedOverflowBox(
          size: Size(300.0, 200.0),
          child: Container(color: Colors.red, width: 200.0, height: 100.0,),
        ),
      ),
    );
  }
}