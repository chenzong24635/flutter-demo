import 'package:flutter/material.dart';

//[Scrollbar](https://api.flutter.dev/flutter/material/Scrollbar-class.html)
/*
作用：滚动指示器（滚动条），如果要给可滚动组件添加滚动条，只需将Scrollbar作为可滚动组件的任意一个父级组件即可

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