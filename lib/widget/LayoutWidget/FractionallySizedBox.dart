import "package:flutter/material.dart";

//[参考](https://juejin.im/post/5b4b31ee5188251a901877c4#heading-9)
/*
继承关系：Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > FractionallySizedBox

const FractionallySizedBox({
  Key key,
  this.alignment = Alignment.center, //对齐方式
  this.widthFactor, // 宽度因子，宽度乘以这个值，就是最后的宽度
  this.heightFactor, // 高度因子
  Widget child,
}) 

其中widthFactor和heightFactor都有一个规则
  如果不为null，那么实际的最大宽高度则为child的宽高乘以这个因子；
  如果为null，那么child的宽高则会尽量充满整个区域。

*/

class FractionallySizedBoxPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FractionallySizedBox'),),
      body: ListView(
        children: <Widget>[
          Text('根据现有空间，来调整child的尺寸，所以说child就算设置了具体的尺寸数值，也不起作用。'),
          Padding(padding: EdgeInsets.all(20),),
          Column(children: <Widget>[
            Text('widthFactor: 1.5,heightFactor: 0.5,',style:TextStyle(fontSize: 20.0)),
            Container(
              color: Colors.blue,
              height: 150.0,
              width: 150.0,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              child: new FractionallySizedBox(
                alignment: Alignment.topLeft,
                widthFactor: 1.5,
                heightFactor: 0.5,
                child: new Container(
                  color: Colors.red,
                ),
              ),
            ),
            Text('widthFactor: 1.5,heightFactor: null,',style:TextStyle(fontSize: 20.0)),
            Container(
              color: Colors.blue,
              height: 150.0,
              width: 150.0,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              child: new FractionallySizedBox(
                alignment: Alignment.topLeft,
                widthFactor: 1.5,
                heightFactor: null,
                child: new Container(
                  color: Colors.red,
                ),
              ),
            ),
            Text('widthFactor: null,heightFactor: 0.5,',style:TextStyle(fontSize: 20.0)),
            Container(
              color: Colors.blue,
              height: 150.0,
              width: 150.0,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              child: new FractionallySizedBox(
                alignment: Alignment.topLeft,
                widthFactor: null,
                heightFactor: 0.5,
                child: new Container(
                  color: Colors.red,
                ),
              ),
            ),
            Text('widthFactor: null,heightFactor: null,',style:TextStyle(fontSize: 20.0)),
            Container(
              color: Colors.blue,
              height: 150.0,
              width: 150.0,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              child: new FractionallySizedBox(
                alignment: Alignment.topLeft,
                widthFactor: null,
                heightFactor: null,
                child: new Container(
                  color: Colors.red,
                ),
              ),
            ),
          ],)
        ]
      ),
    );
  }
}