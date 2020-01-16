import 'package:flutter/material.dart';


//[SingleChildScrollView](https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html)
/*
作用：有一个子widget的可滚动的widget，子内容超过父容器时可以滚动。

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > SingleChildScrollView

构造函数：（类型 属性 = 默认值）
  const SingleChildScrollView({
    Key key,
    this.scrollDirection = Axis.vertical, //滚动方向
    this.reverse = false,
    this.padding,
    bool primary,
    this.physics,
    this.controller,
    this.child,
    this.dragStartBehavior = DragStartBehavior.start,
  })
*/

class SingleChildScrollViewPage extends StatelessWidget {
  const SingleChildScrollViewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('SingleChildScrollView')),
      body: Column(children: <Widget>[
        Text('水平滚动',style: TextStyle(fontSize: 22.0),),
        Container(
          width: 200.0,
          height: 140.0,
          color: Colors.red,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:  Row(children: <Widget>[
              box(Colors.blue),
              box(Colors.grey),
              box(Colors.amber),
            ],),
          ),
        ),
        SizedBox(height: 20.0,),
        Text('垂直滚动',style: TextStyle(fontSize: 22.0),),
        Container(
          width: 200.0,
          height: 140.0,
          color: Colors.red,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: <Widget>[
              box(Colors.blue),
              box(Colors.grey),
              box(Colors.amber),
            ],),
          ),
        ),
      ],)
    );
  }
}

class box extends StatelessWidget {
  Color color;
  box(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: 100.0,
        height: 80.0,
        color: color,
      ),
    );
  }
}