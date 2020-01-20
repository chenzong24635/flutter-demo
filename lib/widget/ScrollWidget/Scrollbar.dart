import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
      body: Scrollbar( // 或者CupertinoScrollbar :iOS风格的滚动条
        child:ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Text('A'*20,style: TextStyle(fontSize: 16.0),),
            Text('B'*20,style: TextStyle(fontSize: 22.0),),
            Text('C'*20,style: TextStyle(fontSize: 32.0),),
          ]
        ),
      ),
    );
  }
}