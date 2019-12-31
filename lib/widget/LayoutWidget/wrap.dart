import "package:flutter/material.dart";

class WrapPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wrap-流式布局'),),
      body: Wrap(
        direction: Axis.horizontal, // 方向。Axis.horizontal-水平方向；Axis.vertical-垂直方向
        alignment: WrapAlignment.center, // 主轴方向对齐方式
        runAlignment: WrapAlignment.center, // 纵轴方向对齐方式
        crossAxisAlignment: WrapCrossAlignment.start, // 交叉轴对齐方式
        spacing: 10.0,// 主轴(水平)方向间距
        runSpacing: 20.0,//纵轴（垂直）方向间距
        verticalDirection: VerticalDirection.down,//扩展方向。VerticalDirection.down-向下（左）增长；VerticalDirection.up-向上增长
        children: <Widget>[
          Text('Wrap1 Wrap1 Wrap1',style: TextStyle(fontSize: 22.0),),
          Text('Wrap2 Wrap2 ',style: TextStyle(fontSize: 22.0),),
          Text('Wrap3 ',style: TextStyle(fontSize: 22.0),),
          Text('Wrap4 ',style: TextStyle(fontSize: 22.0),),
          Divider(),
          Text(
            'Row和Colum时，如果子widget超出屏幕范围，则会报溢出错误',
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            'Wrap 能够同时支持横向或者纵向的列表布局，就像 Row 或者 Column 那样。不同的是，当空间不足时，Wrap 能够自动换行！',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}