import 'package:flutter/material.dart';

//[BottomAppBar](https://api.flutter.dev/flutter/material/Scaffold/BottomAppBar.html)
/*
作用：底部导航栏

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatefulWidget > BottomAppBar

构造函数：（类型 属性 = 默认值）
const BottomAppBar({
  Key key,
  this.color,
  this.elevation,
  this.shape,
  this.clipBehavior = Clip.none,
  this.notchMargin = 4.0,
  this.child,
})
 */

class BottomNavigationBar1Page extends StatefulWidget {
  BottomNavigationBar1Page({Key key}) : super(key: key);

  @override
  _BottomNavigationBar1PageState createState() => _BottomNavigationBar1PageState();
}

class _BottomNavigationBar1PageState extends State<BottomNavigationBar1Page> {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        children: [
          IconButton(icon: Icon(Icons.home),onPressed: (){},),
          SizedBox(), //中间位置空出
          IconButton(icon: Icon(Icons.business),onPressed: (){},),
        ],
      ),
    );
  }
}
