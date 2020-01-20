//[DefaultTextStyle](https://api.flutter.dev/flutter/widgets/DefaultTextStyle-class.html)
/*
作用：用于后代Text小部件的文本样式，无需显式样式。

继承：Object Diagnosticable DiagnosticableTree Widget ProxyWidget InheritedWidget InheritedTheme DefaultTextStyle

构造函数：（类型 属性 = 默认值）
  const DefaultTextStyle({
    Key key,
    @required this.style,
    this.textAlign,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.maxLines,
    this.textWidthBasis = TextWidthBasis.parent,
    @required Widget child,
  })
*/

import 'package:flutter/material.dart';

class DefaultTextStylePage extends StatelessWidget {
  const DefaultTextStylePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      //1.设置文本默认样式  
      style: TextStyle(
        color:Colors.red,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.start,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(""),
          Text('DefaultTextStyle 用法:',style: TextStyle(color: Colors.black,fontSize: 24.0),),
          Text('用于设置默认文本样式',style: TextStyle(color: Colors.black,fontSize: 17.0),),
          Text("我继承了默认样式"),
          Text(
            "我继承默认样式,但重新设定了样式",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16.0,
            ),
          ),
          Text("我不继承默认样式",
            style: TextStyle(
              inherit: false, // 不继承默认样式
              color: Colors.orange
            ),
          ),
        ],
      ),
    );
  }
}