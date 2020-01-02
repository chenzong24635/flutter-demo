import 'package:flutter/material.dart';

/*
GridView和ListView的大多数参数都是相同的

GridView({
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  ScrollController controller,
  bool primary,
  ScrollPhysics physics,
  bool shrinkWrap = false,
  EdgeInsetsGeometry padding,
  bool addAutomaticKeepAlives = true,
  bool addRepaintBoundaries = true,
  double cacheExtent,
  List<Widget> children = const <Widget>[],
  @required SliverGridDelegate gridDelegate, //控制子widget layout的委托
})

gridDelegate属性： 
1.
SliverGridDelegateWithFixedCrossAxisCount({
  @required double crossAxisCount, // 横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了，即ViewPort横轴长度除以crossAxisCount的商。
  double mainAxisSpacing = 0.0, // 主轴方向的间距。
  double crossAxisSpacing = 0.0, // 横轴方向子元素的间距。
  double childAspectRatio = 1.0, // 子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。
})

2.
SliverGridDelegateWithMaxCrossAxisExtent({
  double maxCrossAxisExtent, //子元素在横轴上的最大长度
  double mainAxisSpacing = 0.0,
  double crossAxisSpacing = 0.0,
  double childAspectRatio = 1.0,
})
*/

Widget grid1 = GridView(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3, //横轴三个子widget
      childAspectRatio: 1.0 //宽高比为1时，子widget
  ),
  children:<Widget>[
    Icon(Icons.ac_unit),
    Icon(Icons.airport_shuttle),
    Icon(Icons.all_inclusive),
    Icon(Icons.beach_access),
    Icon(Icons.cake),
    Icon(Icons.free_breakfast),
    Icon(Icons.free_breakfast),
  ]
);

// 等价于

Widget grid2 = GridView.count( 
  crossAxisCount: 3,
  childAspectRatio: 1.0,
  children:<Widget>[
    Icon(Icons.ac_unit),
    Icon(Icons.airport_shuttle),
    Icon(Icons.all_inclusive),
    Icon(Icons.beach_access),
    Icon(Icons.cake),
    Icon(Icons.free_breakfast),
  ],
);


Widget grid3 = GridView(
  padding: EdgeInsets.zero,
  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 120.0,
      childAspectRatio: 2.0 //宽高比为2
  ),
  children: <Widget>[
    Icon(Icons.ac_unit),
    Icon(Icons.airport_shuttle),
    Icon(Icons.all_inclusive),
    Icon(Icons.beach_access),
    Icon(Icons.cake),
    Icon(Icons.free_breakfast),
  ],
);

// Widget grid4 = GridView.builder

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: grid3,
    );
  }
}