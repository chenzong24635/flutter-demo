import "package:flutter/material.dart";

class ColumnPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column--线性布局'),),
      body: Column(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.start, //主轴 对齐方式
        crossAxisAlignment: CrossAxisAlignment.center, // 副轴对齐方式
        mainAxisSize: MainAxisSize.min,// 在主轴(水平)方向占用的空间，默认是MainAxisSize.max，表示尽可能多的占用水平方向的空间，此时无论子widgets实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度；
        verticalDirection: VerticalDirection.down,//在纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。
        children: <Widget>[
          Text('11',style: TextStyle(fontSize: 22.0),),
          Text('1',style: TextStyle(fontSize: 22.0),),
          Text('1',style: TextStyle(fontSize: 22.0),),
          Text('对于行(Row)来说，主轴是水平方向，横轴垂直方向。对于列（Column）来说，主轴垂直方向，横轴水平方向。'),
          Text('Row和Column都只会在主轴方向占用尽可能大的空间'),
          Text('2'),
          Text('如果子widget超出屏幕范围，则会报溢出错误',style: TextStyle(fontSize: 16.0,color: Colors.red),),
          Text('可以使用Wrap，Flow布局',style: TextStyle(fontSize: 16.0,color: Colors.red),),
          Text('可以包在ListVIew里',style: TextStyle(fontSize: 16.0,color: Colors.red),),
          Padding(
            child: Text('222222'),
            padding: EdgeInsets.all(300.0),
          ),
        ],
      ),
      
    );
  }
}