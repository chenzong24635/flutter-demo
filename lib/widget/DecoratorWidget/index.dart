import 'package:flutter/material.dart';

import 'package:flutter1/main.dart';

import 'package:flutter1/widget/DecoratorWidget/Opacity.dart';
import 'package:flutter1/widget/DecoratorWidget/Clip.dart';
import 'package:flutter1/widget/DecoratorWidget/BoxDecoration.dart';
import 'package:flutter1/widget/DecoratorWidget/Chip.dart';


final List<String> myRoutesName = <String>[
  'Opacity',
  'Clip',
  'BoxDecoration',
  'Chip',
];
Map<String, WidgetBuilder> myRoutes = {
  "OpacityPage": (context) => OpacityPage(),
  "ClipPage": (context) => ClipPage(),
  "BoxDecorationPage": (context) => BoxDecorationPage(),
  "ChipPage": (context) => ChipPage(),
};

// void main() => runApp(MyApp());

class DecoratorWidget extends StatelessWidget{
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
        title: Text('装饰/其他组件'),
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