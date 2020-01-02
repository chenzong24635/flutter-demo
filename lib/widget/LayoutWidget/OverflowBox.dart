import "package:flutter/material.dart";

//[参考]()
/*
作用：

继承关系：

*/

class OverflowBoxPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OverflowBox'),),
      body: Container(
        color: Colors.green,
        padding: const EdgeInsets.all(5.0),
        child: Text('OverflowBox')
      ),
    );
  }
}