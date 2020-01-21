import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  var c = "dc380d";

  final Color color = Colors.red; //背景颜色

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Column(
        children: <Widget>[
          Text(
            'Color(0xed0face8)',
            style: TextStyle(color: Color(0xed0face8)),
          ),
          Text(
            'Colors.red',
            style: TextStyle(color: Colors.red),
          ),
          //如何将颜色字符串转成Color对象
          Text(
            'AAA',
            // style: TextStyle(color: Color(int.parse(c,radix:16)|0xFF000000)), //通过位运算符将Alpha设置为FF
            style: TextStyle(color: Color(int.parse(c,radix:16)).withAlpha(255)),  //通过方法将Alpha设置为FF
          ),

          //根据背景色亮度来确定Title颜色
          Container(
            constraints: BoxConstraints(
              minHeight: 52,
              minWidth: double.infinity,
            ),
            decoration: BoxDecoration(
              color: color,
              boxShadow: [
                //阴影
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 3),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Text(
              '标题',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                //根据背景色亮度来确定Title颜色
                color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
              ),
            ),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
