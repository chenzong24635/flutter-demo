import "package:flutter/material.dart";

class RowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row--线性布局'),),
      body: Column(children: <Widget>[
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.end, //主轴 对齐方式
          crossAxisAlignment: CrossAxisAlignment.center, // 副轴对齐方式
          mainAxisSize: MainAxisSize.min,// 在主轴(水平)方向占用的空间，默认是MainAxisSize.max，表示尽可能多的占用水平方向的空间，此时无论子widgets实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度；
          verticalDirection: VerticalDirection.down,//在纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。
          children: <Widget>[
            Text('Row1Row1Row1 ',style: TextStyle(fontSize: 22.0),),
            Text('Row2Row2 ',style: TextStyle(fontSize: 22.0),),
            Text('Row3 ',style: TextStyle(fontSize: 22.0),),
          ],
        ),
        Text('Row和Column都只会在主轴方向占用尽可能大的空间'),
        Padding(padding: EdgeInsets.all(15),),
        Text('如果子widget超出屏幕范围，则会报溢出错误;',style: TextStyle(fontSize: 16.0,color: Colors.red),),
        Text('可以使用Wrap，Flow布局;',style: TextStyle(fontSize: 16.0,color: Colors.red),),
        Padding(padding: EdgeInsets.all(5),),
        Row(
          children: <Widget>[
            Text('Row1 Row1 Row1',style: TextStyle(fontSize: 22.0),),
            Text('Row2 Row2 ',style: TextStyle(fontSize: 22.0),),
            Text('Row3 ',style: TextStyle(fontSize: 22.0),),
            Text('Row3 ',style: TextStyle(fontSize: 22.0),),
            Text('Row3 ',style: TextStyle(fontSize: 22.0),),
            Text('Row3 ',style: TextStyle(fontSize: 22.0),),
          ],
        ),
        Text(''),
        Text('对于行(Row)来说，主轴是水平方向，横轴垂直方向。对于列（Column）来说，主轴垂直方向，横轴水平方向。'),
      ],)
    );
  }
}