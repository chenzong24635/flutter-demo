import "package:flutter/material.dart";

//[]()
//[官网](https://api.flutter.dev/flutter/widgets/Container-class.html)
/*
作用：控制子widget的绘制，大小，定位，填充，约束等的容器

继承：
Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > Container

构造函数：（类型 属性 = 默认值）
Container({
  Key key, //唯一标识符，用于查找更新
  double width,
  double height,
  Alignment alignment = Alignment.topLeft, //对齐方式
  EdgeInsets  padding, //
  EdgeInsets  margin, //
  Matrix4 transform, // 
  Color color, //背景色
  Decoration decoration, //绘制在child后面的装饰; 设置了decoration属性，就不能在外部设置color，只能设置在decoration内，否则报错
  Decoration foregroundDecoration, //绘制在child前面的装饰,可设置color 但可能会遮盖color效果。
  BoxConstraints constraints, //添加到child上额外的约束条件
  Widget child,
})

*/

class ContainerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Container 布局')),
      body: Container(
        width: 200.0,
        height: 400.0,
        // alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
        margin: EdgeInsets.all(20.0),
        transform: Matrix4.identity()..scale(1.2),
        /* constraints: new BoxConstraints.expand(
          height:Theme.of(context).textTheme.display1.fontSize * 1.1 + 10.0,
        ), */
        //color: Colors.red, 
        // color: Colors.red[300], 
        decoration: BoxDecoration( 
          color: Colors.blue, 
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          border: Border.all(color: Colors.orange,width: 5.0),
        ),
        // foregroundDecoration: ,
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