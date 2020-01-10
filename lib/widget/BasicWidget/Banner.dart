import 'package:flutter/material.dart';

//[Banner](https://api.flutter.dev/flutter/widgets/Banner-class.html)
/*
作用：在widget的边角显示一个信息

继承：Object Diagnosticable DiagnosticableTree Widget StatelessWidget Banner

构造函数：（类型 属性 = 默认值）

*/

class BannerPage extends StatefulWidget {
  BannerPage({Key key}) : super(key: key);

  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Banner')),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.yellow,
            height: 100,
            child: Banner(
              message: "hello",
              location: BannerLocation.topEnd,
              color: Colors.red,
              child: Container(
                color: Colors.yellow,
                height: 100,
                child: Center(
                  child: Text("Hello, banner!"),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.yellow,
            height: 100,
            child: ClipRect(
              child: Banner(
                message: "hello",
                location: BannerLocation.topEnd,
                color: Colors.red,
                child: Container(
                  color: Colors.yellow,
                  height: 100,
                  child: Center(
                    child: Text("ClipRect溢出裁剪"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

