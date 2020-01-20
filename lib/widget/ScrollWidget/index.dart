/*
可滚动组件都直接或间接包含一个Scrollable组件
  const Scrollable({
    Key key,
    this.axisDirection = AxisDirection.down, 滚动方向
    ScrollController controller, 主要作用是控制滚动位置和监听滚动事件
    ScrollPhysics physics, 决定可滚动组件如何响应用户操作
    @required this.viewportBuilder,
    this.excludeFromSemantics = false,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
  })
*/

import 'package:flutter/material.dart';

import 'package:flutter1/main.dart';

import './Scrollbar.dart';
import './ListView.dart';
import './GridView.dart';
import './CustomScrollView.dart';
import './NestedScrollView.dart';
import './PageView.dart';
import './SingleChildScrollView.dart';
import './NotificationListener.dart';


final List<String> myRoutesName = <String>[
  'Scrollbar',
  'ListView',
  'GridView',
  'CustomScrollView',
  'NestedScrollView',
  'PageView',
  'SingleChildScrollView',
  'NotificationListener',
];
Map<String, WidgetBuilder> myRoutes = {
  "/ScrollbarPage": (context) => ScrollbarPage(),
  "/ListViewPage": (context) => ListViewPage(),
  "/GridViewPage": (context) => GridViewPage(),
  "/CustomScrollViewPage": (context) => CustomScrollViewPage(),
  "/NestedScrollViewPage": (context) => NestedScrollViewPage(),
  "/PageViewPage": (context) => PageViewPage(),
  "/SingleChildScrollViewPage": (context) => SingleChildScrollViewPage(),
  "/NotificationListenerPage": (context) => NotificationListenerPage(),
};

// void main() => runApp(MyApp());

class ScrollWidget extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyHomePage(),
      routes: myRoutes
    );
  }
}

class MyHomePage extends StatefulWidget {
/*   MyHomePage({Key key, this.title}) : super(key: key);
  final String title; */

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends  State<MyHomePage> {
  var routeLists = myRoutes.keys.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动组件'),
        leading: IconButton( //左边的 Widget。通常放返回键，或者 Drawer 开关
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
          },
        ),
      ),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (context, index) {
            return new InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: new Card(
                child: new Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(15.0),
                  child: new Text(myRoutesName[index],style:TextStyle(fontSize: 18.0)),
                ),
              ),
            );
          },
          itemCount: myRoutesName.length,
        ),
      ),
    );
  }
}