import "package:flutter/material.dart";

class ConstrainedBoxPage extends StatelessWidget {
Widget redBox=DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ConstrainedBox'),),
      body: Column(
        children: <Widget>[
          Text('用于对子组件添加额外的约束',style: TextStyle(fontSize: 20.0)),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: double.infinity, // 
              maxHeight : double.infinity, // 
              minWidth: double.infinity, //宽度尽可能大
              minHeight: 50.0 //最小高度为50像素
            ),
            child: Container(
              height: 5.0, 
              child: redBox,
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
          Text('如果某一个组件有多个父级ConstrainedBox限制，那么最终会是哪个生效'),
          Text('对于minWidth和minHeight,取父子中相应数值较大的'),
          Text('对于maxWidth和maxHeight,取父子中相应数值较小的'),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 90.0), //父
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
              child: redBox,
            )
          ),
          /* ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0,maxWidth: 60.0, maxHeight: 60.0), //父
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 90.0, maxHeight: 10.0),//子
              child: redBox,
            )
          ), */
        ],
      ),
      
    );
  }
}