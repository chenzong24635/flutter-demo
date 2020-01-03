import "package:flutter/material.dart";

//[]()
//[官网](https://api.flutter.dev/flutter/widgets/Placeholder-class.html)
/*
作用：

继承：占位符
Object Diagnosticable DiagnosticableTree Widget StatelessWidget Placeholder

构造函数：
Placeholder({
  Key key,
  Color color , // 设置占位符颜色
  double strokeWidth ,//设置画笔宽度
  double fallbackWidth ,//设置占位符宽度
  double fallbackHeight ,//设置占位符高度
})
*/

class PlaceholderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PlaceholderBox();
  }
}

class PlaceholderBox extends StatefulWidget {
  @override
  _PlaceholderState createState() => new  _PlaceholderState();
}

class  _PlaceholderState extends State<PlaceholderBox> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PlaceHolder"),),
      body: Column(
        children: <Widget>[
          Placeholder(
            color: Colors.blue,
            strokeWidth: 5,
            fallbackHeight: 200,
            fallbackWidth: 200,
          ),
        ],
      ),
    );
  }
}