import "package:flutter/material.dart";
//https://api.flutter.dev/flutter/widgets/FittedBox-class.html
/*
作用：按自己的大小调整其子widget的大小和位置

继承：Object Diagnosticable DiagnosticableTree Widget RenderObjectWidget SingleChildRenderObjectWidget FittedBox

构造函数：（类型 属性 = 默认值）
  const FittedBox({
    Key key,
    this.fit = BoxFit.contain,// 缩放的方式
    this.alignment = Alignment.center, // 对齐方式
    Widget child,
  })
*/
class FittedBoxPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FittedBox'),),
      body: ListView(
        children: <Widget>[
          Column(children: <Widget>[
            Text(
              '缩放（Scale）以及位置调整（Position）,使得child适合其尺寸：',
              style: TextStyle(fontSize: 22.0),
            ),
            Text(
              '1.如果外部有约束的话，按照外部约束调整自身尺寸，然后缩放调整child，按照指定的条件进行布局；',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2.如果没有外部约束条件，则跟child尺寸一致，指定的缩放以及位置属性将不起作用。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0,),
            Image.asset('images/FittedBox.png'),
            SizedBox(height: 20.0,),
            Container(
              color: Colors.amberAccent,
              width: 300.0,
              height: 300.0,
              child: new FittedBox(
                fit: BoxFit.cover, 
                alignment: Alignment.topLeft,
                child: new Container(
                  color: Colors.red,
                  child: new Text("FittedBox"),
                ),
              ),
            ),
          ],)
        ],
      ),
    );
  }
}