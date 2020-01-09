import 'package:flutter/material.dart';

import 'package:flutter1/main.dart';

import './ListView.dart';
import './GridView.dart';
import './SingleChildScrollView.dart';
import './Scrollbar.dart';


final List<String> myRoutesName = <String>[
  'ListView',
  'GridView',
  'SingleChildScrollViewPage',
  'Scrollbar',
];
Map<String, WidgetBuilder> myRoutes = {
  "ListViewPage": (context) => ListViewPage(),
  "GridViewPage": (context) => GridViewPage(),
  "SingleChildScrollViewPage": (context) => SingleChildScrollViewPage(),
  "ScrollbarPage": (context) => ScrollbarPage(),
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