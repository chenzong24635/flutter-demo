import 'package:flutter/material.dart';

//[参考](https://docs.flutter.io/flutter/widgets/ListBody-class.html)
/* 
作用：一般都会配合ListView或者Column等控件使用。ListBody的作用是按给定的轴方向，按照顺序排列子节点。

继承关系：Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > MultiChildRenderObjectWidget > ListBody

构造函数：
ListBody({
  Key key,
  Axis mainAxis = Axis.vertical, //排列的主轴方向
  bool reverse = false, //是否反向
  List<Widget> children = const <Widget>[],
}) 
*/


class ListBodyPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('ListBody')),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          ListBody(
            mainAxis: Axis.vertical,
            reverse: false,
            children: <Widget>[
              Container(color: Colors.red, width: 50.0, height: 50.0,),
              Container(color: Colors.yellow, width: 50.0, height: 50.0,),
              Container(color: Colors.green, width: 50.0, height: 50.0,),
              Container(color: Colors.blue, width: 50.0, height: 50.0,),
              Container(color: Colors.black, width: 50.0, height: 50.0,),
            ],
          )
        ],
      ),
    );
  }
}
