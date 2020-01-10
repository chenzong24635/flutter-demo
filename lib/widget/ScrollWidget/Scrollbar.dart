import 'package:flutter/material.dart';

//[Scrollbar](https://api.flutter.dev/flutter/material/Scrollbar-class.html)
/*
作用：一行末端对齐的按钮，如果没有足够的水平空间，则排成一列。

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatefulWidget > Scrollbar

构造函数：（类型 属性 = 默认值）
  const Scrollbar({
    Key key,
    @required this.child,
    this.controller,
  }) 
*/

class ScrollbarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Scrollbar')),
      body: Scrollbar(
        child:ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Text('AAAA  ',style: TextStyle(fontSize: 22.0),),
            Text('BBB   ',style: TextStyle(fontSize: 22.0),),
            Text('CCC   ',style: TextStyle(fontSize: 22.0),),
            Text('DDDD  ',style: TextStyle(fontSize: 22.0),),
            Text('AAAA111  ',style: TextStyle(fontSize: 22.0),),
            Text('BBB222   ',style: TextStyle(fontSize: 22.0),),
            Text('CCC333   ',style: TextStyle(fontSize: 22.0),),
            Text('DDDD444  ',style: TextStyle(fontSize: 22.0),),
          ]
        ),
      ),
    );
  }
}