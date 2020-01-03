import "package:flutter/material.dart";

//[参考](https://docs.flutter.io/flutter/widgets/CustomSingleChildLayout-class.html)
/*
作用：类似CustomSingleChildLayout，可控制多个

继承关系：Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > MultiChildRenderObjectWidget > CustomMultiChildLayout


构造函数：
CustomSingleChildLayout({
  Key key,
  @required this.delegate, // 必传非空参数，控制子节点的布局，类型为SingleChildLayoutDelegate，
  Widget child
})

delegate可以控制这些因素：
  可以决定每个子节点的布局约束条件；
  可以决定每个子节点的位置；
  可以决定自身的尺寸，但是自身的自身必须不能依赖子节点的尺寸。

*/

class CustomMultiChildLayoutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CustomMultiChildLayout'),),
      body: Container(
  width: 200.0,
  height: 100.0,
  color: Colors.yellow,
  child: CustomMultiChildLayout(
    delegate: TestLayoutDelegate(),
    children: <Widget>[
      LayoutId(
        id: TestLayoutDelegate.title,
        child: new Text("This is title",
            style: TextStyle(fontSize: 20.0, color: Colors.black)),
      ),
      LayoutId(
        id: TestLayoutDelegate.description,
        child: new Text("This is description",
            style: TextStyle(fontSize: 14.0, color: Colors.red)),
      ),
    ],
  ),
),
    );
  }
}
class TestLayoutDelegate extends MultiChildLayoutDelegate {
  TestLayoutDelegate();

  static const String title = 'title';
  static const String description = 'description';

  @override
  void performLayout(Size size) {
    final BoxConstraints constraints =
        new BoxConstraints(maxWidth: size.width);

    final Size titleSize = layoutChild(title, constraints);
    positionChild(title, new Offset(0.0, 0.0));

    final double descriptionY = titleSize.height;
    layoutChild(description, constraints);
    positionChild(description, new Offset(0.0, descriptionY));
  }

  @override
  bool shouldRelayout(TestLayoutDelegate oldDelegate) => false;
}

