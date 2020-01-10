import "package:flutter/material.dart";
import "package:flutter1/widget/LayoutWidget/OverflowBox.dart";
import "package:flutter1/widget/LayoutWidget/SizedOverflowBox.dart";

//[参考](https://docs.flutter.io/flutter/widgets/SizedBox-class.html)
/*
作用：设置具体尺寸

继承关系：Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > SizedBox

构造函数：
SizedBox({ 
  Key key, 
  this.width, //宽度值，如果具体设置了，则强制child宽度为此值，如果没设置，则根据child宽度调整自身宽度。
  this.height,//同上
  Widget child 
})

child为null时，如果设置了宽高，则自身尺寸调整到此宽高值，如果没设置，则尺寸为0；
child不为null时，如果设置了宽高，则会强制把child尺寸调到此宽高；如果没有设置宽高，则会根据child尺寸进行调整；

SizedBox.expand({Key key, Widget child }) // 尽可能大
SizedBox.shrink({Key key, Widget child }) // 尽可能小
SizedBox.fromSize({Key key, Widget child, Size size }) //指定尺寸

*/

class SizedBoxPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SizedBox'),),
      body: Wrap(children: <Widget>[
        Container(
          color: Colors.green,
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            width: 200.0,
            height: 200.0,
            child: Container(
              color: Colors.red,
              width: 100.0,
              height: 300.0,
              child: Text('SizedBox')
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(40.0),),
        Container(
          color: Colors.green,
          padding: const EdgeInsets.all(5.0),
          child: SizedBox.shrink()
        ),
        /* Container(
          color: Colors.orangeAccent,
          padding: const EdgeInsets.all(5.0),
          child: SizedBox.fromSize(size: Size.infinite)
        ), */
        /* Container(
          color: Colors.blueAccent,
          padding: const EdgeInsets.all(5.0),
          child: SizedBox.expand()
        ), */
        OutlineButton(
          child: Text('SizedOverflowBox'),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SizedOverflowBoxPage()));
          },
        ),
        OutlineButton(
          child: Text('OverflowBox'),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => OverflowBoxPage()));
          },
        ),
      ],)
    );
  }
}