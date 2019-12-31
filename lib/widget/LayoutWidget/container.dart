import "package:flutter/material.dart";

class ContainerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Container 布局')),
      body: Container(
        //key: '', //唯一标识符，用于查找更新
        width: 200.0,
        height: 400.0,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
        margin: EdgeInsets.all(20.0),
        transform: Matrix4.identity()..scale(1.2),
        /* constraints: new BoxConstraints.expand(//添加到child上额外的约束条件
          height:Theme.of(context).textTheme.display1.fontSize * 1.1 + 10.0,
        ), */
        //color: Colors.red, 
        // color: Colors.red[300], //设置了decoration属性，就不能在外部设置color，只能设置在decoration内，否则报错
        decoration: BoxDecoration( //绘制在child后面的装饰
          color: Colors.blue, 
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          border: Border.all(color: Colors.orange,width: 5.0),
        ),
        // foregroundDecoration: , //绘制在child前面的装饰,可设置color 但可能会遮盖color效果。
        child: Text(
          '我是Container',
          style: TextStyle(
            fontSize: 22.0,
            color: Color(0xffffff99),
          )
        ),
      )
    );
  }
}