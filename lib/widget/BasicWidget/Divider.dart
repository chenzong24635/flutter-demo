import 'package:flutter/material.dart';
//[Divider](https://api.flutter.dev/flutter/material/Divider-class.html)
/*
作用：一条细的水平线，两侧都有填充物

继承：Object Diagnosticable DiagnosticableTree Widget StatelessWidget Divider

构造函数：（类型 属性 = 默认值）
  const Divider({
    Key key,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
  }) 
*/

class DividerPage extends StatelessWidget {
  const DividerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Divider"),
      ),
      body: Column(children: <Widget>[
        Divider(height: 5.0,color: Colors.red),
        SizedBox(height: 10.0,),
        Divider(thickness: 5.0,color: Colors.black),
        SizedBox(height: 10.0,),
      ])
    );  
  }
}