import 'package:flutter/material.dart';
//[CustomScrollView](https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html)
/*
作用：一个滚动组件，它使用slivers创建自定义滚动效果。
CustomScrollView 中通常添加的是 Sliver 系列的 Widget，
比如 SliverList、SliverGrid、SliverPadding 等，因为它们本身没有包含滚动，所以能被统一成一个整体滚动。

它可以包含多种滚动模型，举个例子，假设有一个页面，顶部需要一个GridView，底部需要一个ListView，而要求整个页面的滑动效果是统一的，即它们看起来是一个整体，


继承：Object Diagnosticable DiagnosticableTree Widget StatelessWidget ScrollView CustomScrollView

构造函数：（类型 属性 = 默认值）
  const CustomScrollView({
    Key key,
    Axis scrollDirection = Axis.vertical, //滚动方向
    bool reverse = false, //是否逆向排布子 Widget
    ScrollController controller, // 控制 ScrollView 滚动的控制器
    bool primary, // 如果 controller 为null，该项为 true，会使用 PrimaryScrollController
    ScrollPhysics physics = AlwaysScrollableScrollPhysics, // 控制滚动效果
    bool shrinkWrap = false, // 是否由内容的大小决定 ScrollView 的大小
    Key center,
    double anchor = 0.0, // 内容区域的锚点（起始位置）。比如设为 0.5，内容区域将会从 ScrollView 中间位置开始
    double cacheExtent,
    int semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    this.slivers = const <Widget>[],
  })
*/

class CustomScrollViewPage extends StatelessWidget {
  const CustomScrollViewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('CustomScrollView'),
            backgroundColor: Colors.amber,
            pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('FlexibleSpaceBar'),
              background: Image(
                image: AssetImage('images/th.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 15,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 40.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index'),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}