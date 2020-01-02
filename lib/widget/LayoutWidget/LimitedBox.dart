import "package:flutter/material.dart";

//[参考]()
//[参考](https://api.flutter.dev/flutter/widgets/LimitedBox-class.html)
/*
作用：

继承关系：

*/

class LimitedBoxPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LimitedBox'),),
      body: Container(
        color: Colors.green,
        padding: const EdgeInsets.all(5.0),
        child: Text('LimitedBox')
      ),
    );
  }
}