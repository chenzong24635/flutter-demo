import "package:flutter/material.dart";

//[参考]()
/*
作用：

继承关系：

*/

class IndexedStackPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IndexedStack'),),
      body: Container(
        color: Colors.green,
        padding: const EdgeInsets.all(5.0),
        child: Text('IndexedStack')
      ),
    );
  }
}