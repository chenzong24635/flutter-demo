import "package:flutter/material.dart";

//[Placeholder](https://api.flutter.dev/flutter/widgets/Placeholder-class.html)
/*
作用：

继承：占位符
Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > Placeholder

构造函数：

const Placeholder({
  Key key,
  this.color = const Color(0xFF455A64), // 占位符颜色
  this.strokeWidth = 2.0, //占位符框中的线宽
  this.fallbackWidth = 400.0, // 占位符宽度
  this.fallbackHeight = 400.0, // 占位符高度
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