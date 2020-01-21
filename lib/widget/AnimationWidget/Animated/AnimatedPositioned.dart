import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/AnimatedPositioned-class.html
/*
作用：Position动画，配合Stack一起使用

继承：

构造函数：（类型 属性 = 默认值）

*/

class AnimatedPositionedPage extends StatefulWidget {
  AnimatedPositionedPage({Key key}) : super(key: key);

  @override
  _AnimatedPositionedPageState createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> with SingleTickerProviderStateMixin {
  double _top = 0;
  double _left = 0;

  void _change(){
    setState(() {
      _top = 100;
      _left = 100;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedPositioned'),),
      body: InkWell(
        onTap: _change,
        child: Stack(children: <Widget>[
          AnimatedPositioned(
            left: _left,
            top: _top,
            duration: Duration(seconds: 3),
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.red,
            ),
          )
        ],),
      )
    );
  }
}