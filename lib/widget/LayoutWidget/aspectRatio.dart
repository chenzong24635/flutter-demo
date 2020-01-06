import "package:flutter/material.dart";
import "package:flutter1/main.dart";

class AspectRatioPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends  State<MyHomePage> {
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100.0,
            child: AspectRatio(
              aspectRatio: 1.5, // 宽高比，最终可能不会根据这个值去布局，只是一个参考值
                                //不能为null,大于0,必须是有限的
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          Text('普通的Image'),
          Container(
            height: 100.0,
            child: Image.asset("images/th.jpg"),
          ),
          Text('包在AspectRatio的Image'),
          Container(
            height: 100.0,
            child: AspectRatio(
              aspectRatio: 1.5, 
              child: Image.asset("images/th.jpg")
            ),
          ),
        ],
      ),
      
    );
  }
}