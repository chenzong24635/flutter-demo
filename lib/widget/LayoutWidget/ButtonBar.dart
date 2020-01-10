import 'package:flutter/material.dart';

//[ButtonBar](https://api.flutter.dev/flutter/material/ButtonBar-class.html)
/*
作用：一行末端对齐的按钮，如果没有足够的水平空间，则排成一列。

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > ButtonBar

构造函数：（类型 属性 = 默认值）
  const ButtonBar({
    Key key,
    this.alignment,
    this.mainAxisSize,
    this.buttonTextTheme,
    this.buttonMinWidth,
    this.buttonHeight,
    this.buttonPadding,
    this.buttonAlignedDropdown,
    this.layoutBehavior,
    this.children = const <Widget>[],
  })
*/

class ButtonBarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('ButtonBar')),
      body: Scrollbar(
        child:ListView(
          scrollDirection: Axis.horizontal, // 水平listView
          children: <Widget>[
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround, //布局方向，默认MainAxisAlignment.end
              mainAxisSize: MainAxisSize.max, //主轴大小，默认MainAxisSize.max
              children: <Widget>[ // Button集合
                RaisedButton(child: Text('ButtonBar1'),color: Colors.red,onPressed: ()=>{},),
                RaisedButton(child: Text('ButtonBar2'),color: Colors.red,onPressed: ()=>{},),
                RaisedButton(child: Text('ButtonBar3'),color: Colors.red,onPressed: ()=>{},),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end, //布局方向，默认MainAxisAlignment.end
              mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
              children: <Widget>[ // Button集合
                RaisedButton(child: Text('ButtonBar1'),color: Colors.yellow,onPressed: ()=>{},),
                RaisedButton(child: Text('ButtonBar2'),color: Colors.yellow,onPressed: ()=>{},),
                RaisedButton(child: Text('ButtonBar3'),color: Colors.yellow,onPressed: ()=>{},),
              ],
            )
          ]
        ),
      ),
    );
  }
}