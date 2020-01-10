import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; //国际化

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
import './Form.dart';
import './TextField.dart';
import './Image.dart';
import './Progress.dart';
import './Slider.dart';
import './Placeholder.dart';
import './ShowDatePicker.dart';
import './Icon.dart';
import './FlutterLogo.dart';

import './Opacity.dart';
import './Clip.dart';
import './BoxDecoration.dart';
import './Chip.dart';
import './Banner.dart';


final List<String> myRoutesName = <String>[
  'Text',
  'Button',
  'DropdownButton',
  'PopupMenuButton',
  'Checkbox',
  'Radio',
  'Switch',
  'Divider',
  'Form',
  'TextField',
  'Image',
  'Progress',
  'Slider',
  'Placeholder',
  'DatePicker TimePicker',
  'Icon',
  'FlutterLogo',
  'Opacity',
  'Clip',
  'BoxDecoration',
  'Chip',
  'Banner',
];

Map<String, WidgetBuilder> myRoutes = {
  "/TextPage": (context) {return new TextPage();},
  "/ButtonPage": (context) {return new ButtonPage();},
  "/DropdownButtonPage": (context) {return new DropdownButtonPage();},
  "/PopupMenuButtonPage": (context) {return new PopupMenuButtonPage();},
  "/CheckboxPage": (context) {return new CheckboxPage();},
  "/RadioPage": (context) {return new RadioPage();},
  "/SwitchPage": (context) {return new SwitchPage();},
  "/DividerPage": (context) {return new DividerPage();},
  "/FormPage": (context) {return new FormPage();},
  "/TextFieldPage": (context) {return new TextFieldPage();},
  "/ImagePage": (context) {return new ImagePage();},
  "/ProgressPage": (context) {return new ProgressPage();},
  "/SliderPage": (context) {return new SliderPage();},
  "/PlaceholderPage": (context) {return new PlaceholderPage();},
  "/ShowDatePickerPage": (context) {return new ShowDatePickerPage();},
  "/IconPage": (context) {return new IconPage();},
  "/FlutterLogoPage": (context) {return new FlutterLogoPage();},
  "/OpacityPage": (context) => OpacityPage(),
  "/ClipPage": (context) => ClipPage(),
  "/BoxDecorationPage": (context) => BoxDecorationPage(),
  "/ChipPage": (context) => ChipPage(),
  "/BannerPage": (context) => BannerPage(),
};

class BasicWidget extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyHomePage(),
      routes: myRoutes, 
      //国际化
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      locale: Locale('zh'),
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
        title: Text('基础/装饰组件'),
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