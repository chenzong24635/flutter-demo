import 'package:flutter/material.dart';

//[Grid](https://docs.flutter.io/flutter/widgets/GridView-class.html)
/*
作用：GridView和ListView的大多数参数都是相同的

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > ScrollView > BoxScrollView > GridView

构造函数：

GridView({
  Axis scrollDirection = Axis.vertical, //滚动方向。Axis.vertical-垂直方向（默认）；Axis.horizontal-水平方向
  bool reverse = false, // 是否反向排列 children
  ScrollController controller, // 滚动控制器
  bool primary, // 如果 controller 为null，该项为 true时，会使用 PrimaryScrollController
  ScrollPhysics physics, // 控制滚动效果。默认 AlwaysScrollableScrollPhysics
  bool shrinkWrap = false, // 是否根据子 Widget 的总宽度来设置 ListView 的宽度
  EdgeInsetsGeometry padding, //间距
  bool addAutomaticKeepAlives = true,
  bool addRepaintBoundaries = true,
  double cacheExtent,
  List<Widget> children = const <Widget>[],
  @required SliverGridDelegate gridDelegate, //控制子widget layout的委托
})

Flutter中提供了两个SliverGridDelegate的子类 :

1.SliverGridDelegateWithFixedCrossAxisCount
该子类实现了一个横轴为固定数量子元素的layout算法
SliverGridDelegateWithFixedCrossAxisCount({
  @required double crossAxisCount, // 横轴子元素的数量。此属性值确定后子元素在横轴的宽度就确定了，即ViewPort横轴宽度除以crossAxisCount的商。
  double mainAxisSpacing = 0.0, // 主轴方向的间距。
  double crossAxisSpacing = 0.0, // 横轴方向子元素的间距。
  double childAspectRatio = 1.0, // 子元素在主轴宽度/交叉轴宽度的比例。由于crossAxisCount指定后，子元素横轴宽度就确定了，然后通过此参数值就可以确定子元素在主轴的宽度。
})

2. SliverGridDelegateWithMaxCrossAxisExtent
该子类实现了一个横轴子元素为固定最大宽度的layout算法
SliverGridDelegateWithMaxCrossAxisExtent({
  double maxCrossAxisExtent, //子元素在横轴上的最大宽度
  double mainAxisSpacing = 0.0,
  double crossAxisSpacing = 0.0,
  double childAspectRatio = 1.0,
})
*/


//GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，
//可以快速的创建横轴固定数量子元素的GridView
/*
GridView.count(
  crossAxisCount,
  mainAxisSpacing,
  crossAxisSpacing,
  childAspectRatio:,
  children,
);
*/

//GridView.extent构造函数内部使用了 SliverGridDelegateWithMaxCrossAxisExtent
//可以快速的创建纵轴子元素为固定最大宽度的的GridView
/*
GridView.extent(
  maxCrossAxisExtent,
  mainAxisSpacing,
  crossAxisSpacing,
  childAspectRatio,
  children,
);
*/

/*
GridView.builder({
  // GridView 公共参数已省略  
  ...
  @required IndexedWidgetBuilder itemBuilder, // 	子 Widget 构建器
  int itemCount, // 列表项的数量
  ...
})
*/



Widget grid = GridView(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3, //横轴三个子widget
      childAspectRatio: 1.0 //宽高比为1时，子widget
  ),
  children:<Widget>[
    Icon(Icons.ac_unit,color: Colors.yellowAccent,),
    Icon(Icons.airport_shuttle),
    Icon(Icons.all_inclusive),
    Icon(Icons.beach_access),
    Icon(Icons.cake),
    Icon(Icons.free_breakfast),
    Icon(Icons.free_breakfast),
  ]
);

Widget grid1 = GridView(
  padding: EdgeInsets.zero,
  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 120.0,
      childAspectRatio: 2.0 //宽高比为2
  ),
  children: <Widget>[
    Icon(Icons.ac_unit,color: Colors.green,),
    Icon(Icons.airport_shuttle),
    Icon(Icons.all_inclusive),
    Icon(Icons.beach_access),
    Icon(Icons.cake),
    Icon(Icons.free_breakfast),
  ],
);


// 等价于

Widget grid_count = GridView.count( 
  crossAxisCount: 3,
  childAspectRatio: 1.0,
  children:<Widget>[
    Icon(Icons.ac_unit,color: Colors.red,),
    Icon(Icons.airport_shuttle),
    Icon(Icons.all_inclusive),
    Icon(Icons.beach_access),
    Icon(Icons.cake),
    Icon(Icons.free_breakfast),
  ],
);

//等价于

Widget grid_extent = GridView.extent(
  maxCrossAxisExtent: 120.0,
  childAspectRatio: 2.0,
  children: <Widget>[
    Icon(Icons.ac_unit,color: Colors.amber,),
    Icon(Icons.airport_shuttle),
    Icon(Icons.all_inclusive),
    Icon(Icons.beach_access),
    Icon(Icons.cake),
    Icon(Icons.free_breakfast),
  ],
);




/* Widget grid_builder = GridView.builder(
  itemCount: 11,
  itemBuilder: (BuildContext context, int index) {
  }
) */

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: grid,
      // body: grid1,
      // body: grid_extent,
      // body: grid_count,
    );
  }
}