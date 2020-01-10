import "package:flutter/material.dart";

//[参考](https://juejin.im/post/5b4b31ee5188251a901877c4#heading-0)
/*
作用：一般用于文字排版

继承关系：Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > Baseline

const Baseline({
  Key key,
  @required this.baseline, // 基准线位置，必须，从顶部算。
  @required this.baselineType, // 基准线类型，必须
  Widget child
})

Baseline控件布局行为分为两种情况：
  如果child有baseline，则根据child的baseline属性，调整child的位置；
  如果child没有baseline，则根据child的bottom，来调整child的位置。

baselineType属性值:
  alphabetic：对齐字符底部的水平线；
  ideographic：对齐表意字符的水平线。
*/

class BaselinePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Baseline'),),
      body: ListView(
        children: <Widget>[
          Text('一般用于文字排版'),
          Image.asset('images/Baseline.jpg'),
          Row(children: <Widget>[
            new Baseline(
              baseline: 50.0, 
              baselineType: TextBaseline.alphabetic,
              child: new Text(
                'TjTjTj',
                style: new TextStyle(
                  fontSize: 20.0,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
            ),
            new Baseline(
              baseline: 50.0,
              baselineType: TextBaseline.alphabetic,
              child: new Container(
                width: 30.0,
                height: 30.0,
                color: Colors.red,
              ),
            ),
            new Baseline(
              baseline: 50.0,
              baselineType: TextBaseline.alphabetic,
              child: new Text(
                'RyRyRy',
                style: new TextStyle(
                  fontSize: 35.0,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
            ),
          ],),
          SizedBox(height: 100.0,),
          Container(
            color: Colors.blue,
            height: 120.0,
            width: 120.0,
            child: Baseline(
              child: Container(
                color: Colors.red,
                height: 60.0,
                width: 60.0,
              ),
              baseline: 20.0,
              baselineType: TextBaseline.alphabetic,
            ),
          ),
        ]
      ),
    );
  }
}
