import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/AnimatedSize-class.html
/*
作用：尺寸动画

继承：

构造函数：（类型 属性 = 默认值）

*/

class AnimatedSizePage extends StatefulWidget {
  AnimatedSizePage({Key key}) : super(key: key);

  @override
  _AnimatedSizePageState createState() => _AnimatedSizePageState();
}

class _AnimatedSizePageState extends State<AnimatedSizePage> with SingleTickerProviderStateMixin {
  double _width = 50.0;
  double _height = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedSize'),),
      body: InkWell(
        child: AnimatedSize(
          duration: Duration(seconds: 3),
          child: Container(
            height: _width, 
            width: _height, 
            color: Colors.red,
          ),
          vsync: this
        ),
        onTap: (){
          _height = 300.0;
        },
      ),
    );
  }
}