import "package:flutter/material.dart";

//[参考](https://docs.flutter.io/flutter/widgets/CustomSingleChildLayout-class.html)
/*
作用：一个通过外部传入的布局行为，来进行布局的控件，

继承关系：Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > CustomSingleChildLayout

构造函数：
CustomSingleChildLayout({
  Key key,
  @required this.delegate, // 必传非空参数，控制子节点的布局，类型为SingleChildLayoutDelegate，
  Widget child
})

delegate可以控制这些因素：
  可以控制child的布局constraints；
  可以控制child的位置；
  在parent的尺寸不依赖于child的情况下，可以决定parent的尺寸。

*/

class CustomSingleChildLayoutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CustomSingleChildLayout'),),
      body: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(5.0),
        child: CustomSingleChildLayout(
          delegate:  MyDelegate(Size(200.0, 200.0)),
          child: Container(
            color: Colors.yellow,
            width: 100.0,
            height: 300.0,
          ),
        ),
      ),
    );
  }
}
class MyDelegate extends SingleChildLayoutDelegate {
  MyDelegate(this.size);

  final Size size;

  @override
  Size getSize(BoxConstraints constraints) => size;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return new BoxConstraints.tight(size);
  }

  @override
  bool shouldRelayout(MyDelegate oldDelegate) {
    return size != oldDelegate.size;
  }
}
