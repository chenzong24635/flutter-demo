import "package:flutter/material.dart";

//[Flutter实战](https://book.flutterchina.club/chapter4/wrap_and_flow.html)
//[官网](https://api.flutter.dev/flutter/widgets/Flow-class.html)
/*
作用：流式布局，根据FlowDelegate中的逻辑，可有效调整子元素大小和位置的小部件。
实现过于复杂；不能自适应子widget的大小

继承：
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > MultiChildRenderObjectWidget > Flow

构造函数：（类型 属性 = 默认值）
Flow(
  FlowDelegate delegate, //控制子组件的转换矩阵
  List<Widget> children 
)

FlowDelegate包含如下几个方法：
  getConstraintsForChild: 设置每个child的布局约束条件，会覆盖已有的；
  getSize：设置Flow的尺寸；
  paintChildren：child的绘制控制代码，可以调整尺寸位置，写起来比较的繁琐；
  shouldRepaint：是否需要重绘；
  shouldRelayout：是否需要重新布局

*/
class FlowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flow-流式布局'),),
      body: Wrap(
       
        children: <Widget>[
          Text('我们一般很少会使用Flow，因为其过于复杂，需要自己实现子widget的位置转换',style: TextStyle(fontSize: 20.0),),
          Flow(
            delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
            children: <Widget>[
              Container(width: 80.0, height:80.0, color: Colors.red,),
              Container(width: 80.0, height:80.0, color: Colors.green,),
              Container(width: 80.0, height:80.0, color: Colors.blue,),
              Container(width: 80.0, height:80.0,  color: Colors.yellow,),
              Container(width: 80.0, height:80.0, color: Colors.brown,),
              Container(width: 80.0, height:80.0,  color: Colors.purple,),
            ],
          ),
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置  
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)  
        context.paintChild(i,transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小  
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}