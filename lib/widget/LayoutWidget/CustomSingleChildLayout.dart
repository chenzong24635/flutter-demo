import "package:flutter/material.dart";

//[参考]()
/*
作用：

继承关系：

*/

/* class MyBox extends StatelessWidget{
  MyBox({@required this.color});
  Colors color;
  @override
  Widget build(BuildContext context){
    return DecoratedBox(
    child: Text('',style:TextStyle(color: color)),
    decoration: BoxDecoration(color: Colors.red),
  );
  }
} */

class CustomSingleChildLayoutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CustomSingleChildLayout'),),
      body: Container(
        color: Colors.green,
        padding: const EdgeInsets.all(5.0),
        child: Text('dsaas')
      ),
    );
  }
}