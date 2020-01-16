import 'package:flutter/material.dart';

//[]()
/*
作用：最基础的展开小部件expansion tile

继承：

构造函数：（类型 属性 = 默认值）

  const ExpansionTile({
    Key key,
    this.leading,
    @required this.title,
    this.subtitle,
    this.backgroundColor, //展开后的背景色
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing, //右边的小箭头
    this.initiallyExpanded = false, //最初的状态是否被展开
  })
*/
class ExpansionTilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ExpansionTile'),),
      body: ExpansionTile(
        title: Text('ExpansionTile'),
        leading: Icon(Icons.ac_unit),
        backgroundColor: Colors.amber,
        children: <Widget>[
          ListTile(
            title: Text('list tile'),
            subtitle: Text('subtitle'),
          ),
        ],
        // initiallyExpanded: true,
      ),
    );
  }
}