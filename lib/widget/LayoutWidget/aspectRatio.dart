import "package:flutter/material.dart";
import "package:flutter1/main.dart";

class AspectRatioPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: MyHomePage(),
      // routes: myRoutes
    );
    /* return Scaffold(
      appBar: AppBar(title: Text('AspectRatio'),),
      body: Column(
        children: <Widget>[
          Text('2')
        ],
      ),
      
    ); */
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
        leading: IconButton( //左边的 Widget。通常放返回键，或者 Drawer 开关
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip
        ),
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
            child: Image.asset("lib/images/th.jpg"),
          ),
          Text('包在AspectRatio的Image'),
          Container(
            height: 100.0,
            child: AspectRatio(
              aspectRatio: 1.5, 
              child: Image.asset("lib/images/th.jpg")
            ),
          ),
        ],
      ),
      
    );
  }
}