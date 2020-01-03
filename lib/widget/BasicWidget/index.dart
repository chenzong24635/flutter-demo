import 'package:flutter/material.dart';

import 'package:flutter1/main.dart';

import 'package:flutter1/widget/BasicWidget/Text.dart';
import 'package:flutter1/widget/BasicWidget/TextField.dart';
import 'package:flutter1/widget/BasicWidget/Button.dart';
import 'package:flutter1/widget/BasicWidget/Checkbox.dart';
import 'package:flutter1/widget/BasicWidget/Switch.dart';
import 'package:flutter1/widget/BasicWidget/Form.dart';
import 'package:flutter1/widget/BasicWidget/Image.dart';
import 'package:flutter1/widget/BasicWidget/Progress.dart';
import 'package:flutter1/widget/BasicWidget/Placeholder.dart';
import 'package:flutter1/widget/BasicWidget/Icon.dart';


final List<String> myRoutesName = <String>[
  'Text',
  'TextField',
  'Button',
  'Checkbox',
  'Switch',
  'Form',
  'Image',
  'Progress',
  'Placeholder',
  'Icon',
];
Map<String, WidgetBuilder> myRoutes = {
  "TextPage": (context) {return new TextPage();},
  "TextFieldPage": (context) {return new TextFieldPage();},
  "ButtonPage": (context) {return new ButtonPage();},
  "CheckboxPage": (context) {return new CheckboxPage();},
  "SwitchPage": (context) {return new SwitchPage();},
  "FormPage": (context) {return new FormPage();},
  "ImagePage": (context) {return new ImagePage();},
  "ProgressPage": (context) {return new ProgressPage();},
  "PlaceholderPage": (context) {return new PlaceholderPage();},
  "IconPage": (context) {return new IconPage();},
};

// void main() => runApp(MyApp());

class BasicWidget extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Demo',
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
        title: Text('基础组件'),
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