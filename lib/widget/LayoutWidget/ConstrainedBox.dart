import "package:flutter/material.dart";

//[ConstrainedBox](https://api.flutter.dev/flutter/widgets/ConstrainedBox-class.html)
/*
作用：对子组件添加额外的尺寸约束

继承：Object Diagnosticable DiagnosticableTree Widget RenderObjectWidget SingleChildRenderObjectWidget ConstrainedBox

构造函数：（类型 属性 = 默认值）
  ConstrainedBox({
    Key key,
    BoxConstraints @required this.constraints,
    Widget child,
  })

  const BoxConstraints({
    this.minWidth = 0.0,
    this.maxWidth = double.infinity,
    this.minHeight = 0.0,
    this.maxHeight = double.infinity,
  })
*/
class MyBox extends StatelessWidget{
  final String cnt;
  MyBox({@required this.cnt});
  @override
  Widget build(BuildContext context){
    return DecoratedBox(
    child: Text('$cnt',style:TextStyle(color: Colors.white)),
    decoration: BoxDecoration(color: Colors.red),
  );
  }
}
class ConstrainedBoxPage extends StatelessWidget {
  final String cnt = 'box box box box box box box box box box box box box box';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ConstrainedBox,UnconstrainedBox --尺寸限制类容器'),),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
            Text('ConstrainedBox用于对子组件添加额外的约束',style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold)),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: double.infinity, // 
                maxHeight : double.infinity, // 
                minWidth: double.infinity, //宽度尽可能大
                minHeight: 50.0 //最小高度为50像素
              ),
              child: Container(
                height: 5.0, 
                child: MyBox(cnt: cnt),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0),
              //等价于
              //constraints: BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,maxWidth: 80.0)
              child: MyBox(cnt: cnt),
            ),
            Padding(padding: EdgeInsets.all(10),),
            Text('如果某一个组件有多个父级ConstrainedBox限制，那么最终会是哪个生效?',style: TextStyle(fontSize: 18.0)),
            Text('对于minWidth和minHeight,取父子中相应数值较大的',style: TextStyle(fontSize: 16.0)),
            Text('对于maxWidth和maxHeight,取父子中相应数值较小的',style: TextStyle(fontSize: 16.0)),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200.0,minWidth: 60.0, minHeight: 100.0), //父
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 310.0,minWidth: 100.0, minHeight: 20.0),//子
                child: MyBox(cnt: cnt),
              )
            ),
            Padding(padding: EdgeInsets.all(10),),
            Text('UnconstrainedBox:不会对子组件产生任何限制，它允许其子组件按照其本身大小绘制',style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold)),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),   //父
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 100.0, minHeight: 20.0),//子
                child: MyBox(cnt: '我被限制,minHeight为父级的100.0（取父子中最大值）'),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),   //父
              child: UnconstrainedBox( //“去除”父级限制
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 100.0, minHeight: 50.0),//子
                  child: MyBox(cnt: '去除父级限制，minHeight为子元素的50.0，而不是父级的100.0'),
                ),
              )
            ),
          ],
          )
        ],
      ),
    );
  }
}