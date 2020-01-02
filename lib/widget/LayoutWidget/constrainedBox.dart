import "package:flutter/material.dart";

class MyBox extends StatelessWidget{
  MyBox({@required this.cnt});
  String cnt;
  @override
  Widget build(BuildContext context){
    return DecoratedBox(
    child: Text('$cnt',style:TextStyle(color: Colors.blue)),
    decoration: BoxDecoration(color: Colors.red),
  );
  }
}
class ConstrainedBoxPage extends StatelessWidget {
  Widget redBox= DecoratedBox(
    child: Text('Box Box Box Box Box Box Box Box Box Box Box ',style:TextStyle(color: Colors.blue)),
    decoration: BoxDecoration(color: Colors.red,),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ConstrainedBox'),),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
            Text('ConstrainedBox用于对子组件添加额外的约束',style: TextStyle(fontSize: 18.0)),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: double.infinity, // 
                maxHeight : double.infinity, // 
                minWidth: double.infinity, //宽度尽可能大
                minHeight: 50.0 //最小高度为50像素
              ),
              child: Container(
                height: 5.0, 
                child: MyBox(cnt: '423'),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0),
              //等价于
              //constraints: BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,maxWidth: 80.0)
              child: redBox, 
            ),
            Padding(padding: EdgeInsets.all(10),),
            Text('如果某一个组件有多个父级ConstrainedBox限制，那么最终会是哪个生效?',style: TextStyle(fontSize: 18.0)),
            Text('对于minWidth和minHeight,取父子中相应数值较大的',style: TextStyle(fontSize: 16.0)),
            Text('对于maxWidth和maxHeight,取父子中相应数值较小的',style: TextStyle(fontSize: 16.0)),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200.0,minWidth: 60.0, minHeight: 100.0), //父
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 310.0,minWidth: 100.0, minHeight: 20.0),//子
                child: redBox,
              )
            ),
            Padding(padding: EdgeInsets.all(10),),
            Text('UnconstrainedBox:不会对子组件产生任何限制，它允许其子组件按照其本身大小绘制',style: TextStyle(fontSize: 16.0)),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),   //父
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 100.0, minHeight: 20.0),//子
                child: redBox,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),   //父
              child: UnconstrainedBox( //“去除”父级限制
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 100.0, minHeight: 20.0),//子
                  child: redBox,
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