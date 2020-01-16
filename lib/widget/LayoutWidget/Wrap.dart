import "package:flutter/material.dart";
import "package:flutter1/widget/LayoutWidget/Flow.dart";

//[Flutter实战](https://book.flutterchina.club/chapter4/wrap_and_flow.html)
//https://api.flutter.dev/flutter/widgets/Wrap-class.html)
/*
作用：流式布局，在多个水平或垂直运行中显示其子部件（即可换行的Row/Column)

继承：
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > MultiChildRenderObjectWidget > Wrap

构造函数：（类型 属性 = 默认值）

Wrap(
  TextDirection textDirection = TextDirection.ltr,
  Axis direction = Axis.horizontal, // 方向。水平方向 | 垂直方向
  WrapAlignment alignment = WrapAlignment.start,  // 主轴 对齐方式
  WrapAlignment runAlignment = WrapAlignment.start, // 副轴 对齐方式
  WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start, // 交叉轴 对齐方式
  double spacing = 0.0, // 主轴方向 间距
  double runSpacing = 0.0, //副轴方向 间距
  VerticalDirection verticalDirection = VerticalDirection.down, //扩展方向
  List<Widget> children,
)

*/

class WrapPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wrap'),),
      body: Wrap(
        direction: Axis.horizontal, 
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center, 
        crossAxisAlignment: WrapCrossAlignment.start, 
        spacing: 10.0,
        runSpacing: 20.0,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Text('Wrap1 Wrap1 Wrap1',style: TextStyle(fontSize: 22.0),),
          Text('Wrap2 Wrap2 ',style: TextStyle(fontSize: 22.0),),
          Text('Wrap3 ',style: TextStyle(fontSize: 22.0),),
          Text('Wrap4 ',style: TextStyle(fontSize: 22.0),),
          Divider(),
          Text(
            'Row和Colum时，如果子widget超出屏幕范围，则会报溢出错误',
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            'Wrap 能够同时支持横向或者纵向的列表布局，就像 Row 或者 Column 那样。不同的是，当空间不足时，Wrap 能够自动换行！',
            style: TextStyle(fontSize: 18.0),
          ),
          OutlineButton(
            child:Text('Flow 布局'),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => FlowPage()));
            },
          ),
        ],
      ),
    );
  }
}