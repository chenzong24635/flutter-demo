import 'package:flutter/material.dart';

import 'package:flutter1/main.dart';

import './Hero.dart';
import './Dismissible.dart';
import './Draggable.dart';
import './GestureDetector.dart';
import './AnimatedContainer.dart';
import './AnimatedDefaultTextStyle.dart';


final List<String> myRoutesName = <String>[
  'Hero',
  'Dismissible',
  'Draggable',
  'GestureDetector',
  'AnimatedContainer',
  'AnimatedDefaultTextStylePage',
];
Map<String, WidgetBuilder> myRoutes = {
  "/HeroPage": (context) => HeroPage(),
  "/DismissiblePage": (context) => DismissiblePage(),
  "/DraggablePage": (context) => DraggablePage(),
  "/GestureDetectorPage": (context) => GestureDetectorPage(),
  "/AnimatedContainerPage": (context) => AnimatedContainerPage(),
  "/AnimatedDefaultTextStylePage": (context) => AnimatedDefaultTextStylePage(),
};

// void main() => runApp(MyApp());

class AnimationWidget extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyHomePage(),
      routes: myRoutes
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends  State<MyHomePage> {
  var routeLists = myRoutes.keys.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
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