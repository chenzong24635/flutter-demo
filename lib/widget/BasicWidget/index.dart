import 'package:flutter/material.dart';

import 'package:flutter1/main.dart';

// import 'package:flutter1/widget/BasicWidget/Scaffold.dart';
import './Text.dart';
import './Button.dart';
import './DropdownButton.dart';
import './PopupMenuButton.dart';
import './Checkbox.dart';
import './Radio.dart';
import './Switch.dart';
import './Divider.dart';
import './TextField.dart';
import './Form.dart';
import './Image.dart';
import './Progress.dart';
import './Slider.dart';
import './Placeholder.dart';
import './ShowDatePicker.dart';
import './Icon.dart';
import './FlutterLogo.dart';


final List<String> myRoutesName = <String>[
  // 'Scaffold',
  'Text',
  'Button',
  'DropdownButton',
  'PopupMenuButton',
  'Checkbox',
  'Radio',
  'Switch',
  'Divider',
  'TextField',
  'Form',
  'Image',
  'Progress',
  'Slider',
  'Placeholder',
  'ShowDatePicker',
  'Icon',
  'FlutterLogo',
];
Map<String, WidgetBuilder> myRoutes = {
  "TextPage": (context) {return new TextPage();},
  "ButtonPage": (context) {return new ButtonPage();},
  "DropdownButtonPage": (context) {return new DropdownButtonPage();},
  "PopupMenuButtonPage": (context) {return new PopupMenuButtonPage();},
  "CheckboxPage": (context) {return new CheckboxPage();},
  "RadioPage": (context) {return new RadioPage();},
  "SwitchPage": (context) {return new SwitchPage();},
  "DividerPage": (context) {return new DividerPage();},
  "TextFieldPage": (context) {return new TextFieldPage();},
  "FormPage": (context) {return new FormPage();},
  "ImagePage": (context) {return new ImagePage();},
  "ProgressPage": (context) {return new ProgressPage();},
  "SliderPage": (context) {return new SliderPage();},
  "PlaceholderPage": (context) {return new PlaceholderPage();},
  "ShowDatePickerPage": (context) {return new ShowDatePickerPage();},
  "IconPage": (context) {return new IconPage();},
  "FlutterLogoPage": (context) {return new FlutterLogoPage();},
};

// void main() => runApp(MyApp());

class BasicWidget extends StatelessWidget{
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