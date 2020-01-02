import "package:flutter/material.dart";

//[参考]()
/*
作用：

继承关系：

*/

class SizedOverflowBoxPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SizedOverflowBox'),),
      body: Container(
        color: Colors.green,
        padding: const EdgeInsets.all(5.0),
        child: Text('Offstage')
      ),
    );
  }
}