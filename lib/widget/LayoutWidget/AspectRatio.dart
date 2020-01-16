import "package:flutter/material.dart";

//https://api.flutter.dev/flutter/widgets/AspectRatio-class.html
/*
作用：将子widget的大小指定为某个特定的长宽比

继承：Object Diagnosticable DiagnosticableTree Widget RenderObjectWidget SingleChildRenderObjectWidget AspectRatio

构造函数：（类型 属性 = 默认值）
  const AspectRatio({
    Key key,
    @required this.aspectRatio,  // 宽高比，最终可能不会根据这个值去布局，只是一个参考值,不能为null,大于0,必须是有限的
    Widget child,
  }) 
*/

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
              aspectRatio: 1.5,
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