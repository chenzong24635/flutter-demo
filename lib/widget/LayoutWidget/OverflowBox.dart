import "package:flutter/material.dart";

//[参考](https://docs.flutter.io/flutter/widgets/OverflowBox-class.html)
/*
作用：允许child超出parent的范围显示

继承关系：Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > OverflowBox

const OverflowBox({
  Key key,
  this.alignment = Alignment.center, // 对齐方式
  this.minWidth, // 允许child的最小宽度。如果child宽度小于这个值，则按照最小宽度进行显示。
  this.maxWidth, // 允许child的最大宽度。如果child宽度大于这个值，则按照最大宽度进行展示。
  this.minHeight,// 允许child的最小高度。如果child高度小于这个值，则按照最小高度进行显示。
  this.maxHeight,// 允许child的最大高度。如果child高度大于这个值，则按照最大高度进行展示。
  Widget child,
})
*/

class OverflowBoxPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OverflowBox'),),
      body: Container(
        color: Colors.green,
        padding: const EdgeInsets.all(5.0),
        child: Container(
          color: Colors.green,
          width: 200.0,
          height: 200.0,
          padding: const EdgeInsets.all(15.0),
          child: OverflowBox(
            alignment: Alignment.topLeft,
            maxWidth: 300.0,
            maxHeight: 500.0,
            child: Container(
              alignment: Alignment.centerRight,
              color: Color(0x33FF00FF),
              width: 400.0,
              height: 400.0,
              child: Text('子级（粉盒)，其超出了父级(绿盒),但被OverflowBox的maxWidth，maxHeight等限制'),
            ),
          ),
        ),
      ),
    );
  }
}