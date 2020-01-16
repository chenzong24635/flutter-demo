import 'package:flutter/material.dart';

//
/*
作用：

继承：

构造函数：（类型 属性 = 默认值）

*/

class DemoPage extends StatefulWidget {
  DemoPage({Key key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedDefaultTextStyle'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            //
            child: AnimatedDefaultTextStyle (
              style: selected ? 
                TextStyle(
                  fontSize: 50.0,
                  color: Colors.blue
                )
                : 
                TextStyle(
                  fontSize: 15.0,
                  color: Colors.black
                ),
              duration: Duration(seconds: 3),
              curve: Curves.fastOutSlowIn,
              child: Text('fsfssf'),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Text('Change',style:TextStyle(fontSize: 22.0,color: Colors.red))
          ),
        ],
      )
    );
  }
}