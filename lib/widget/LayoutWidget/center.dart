import "package:flutter/material.dart";

class CenterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Center'),),
      body: Column(
        children: <Widget>[
          Text(
            'Center继承自Align，只不过是将alignment设置为Alignment.center，其他属性例如widthFactor、heightFactor，布局行为，都与Align完全一样',
            style: TextStyle(fontSize: 20.0),
          ),
          Center(
            widthFactor: 2.0, //宽度因子，如果设置的话，Center的宽度就是child的宽度乘以这个值，不能为负数。
            heightFactor: 3.0,//高度因子，如果设置的话，Center的高度就是child的高度乘以这个值，不能为负数。
            child: FlutterLogo(
              size: 60,
            ),
          ),
          Text('widthFactor或heightFactor为null时组件的宽高将会占用尽可能多的空间'),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              child: Text("xxx"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: Text("xxx"),
            ),
          ),
        ],
      ),
      
    );
  }
}