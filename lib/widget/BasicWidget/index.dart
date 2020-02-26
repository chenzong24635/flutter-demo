import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; //国际化

import 'package:flutter1/main.dart';

// import 'package:flutter1/widget/BasicWidget/Scaffold.dart';
import './Form/Text.dart';
import './Button/Button.dart';
import './Image.dart';
import './Form/Checkbox.dart';
import './Form/Radio.dart';
import './Form/Switch.dart';
import './Divider.dart';
import './Form/Form.dart';
import './Form/TextField.dart';
import './InkWell.dart';
import './Stepper.dart';
import './Progress.dart';
import './Slider.dart';
import './RefreshIndicator.dart';
import './Placeholder.dart';
import './ShowDatePicker.dart';
import './Icon.dart';
import './FlutterLogo.dart';
import './Tooltip.dart';
import './Opacity.dart';
import './Clip.dart';
import './BoxDecoration.dart';
import './Chip/Chip.dart';
import './Banner.dart';
import './BackdropFilter.dart';


final List<String> myRoutesName = <String>[
  'Text',
  'Button',
  'Image',
  'Checkbox',
  'Radio',
  'Switch',
  'Divider',
  'Form',
  'TextField',
  'InkWell',
  'Stepper',
  'Progress',
  'Slider',
  'RefreshIndicator',
  'Placeholder',
  'DatePicker TimePicker',
  'Icon',
  'FlutterLogo',
  'Tooltip',
  'Opacity',
  'Clip',
  'BoxDecoration',
  'Chip',
  'Banner',
  'BackdropFilter',
];

Map<String, WidgetBuilder> myRoutes = {
  "/TextPage": (context) {return new TextPage();},
  "/ButtonPage": (context) {return new ButtonPage();},
  "/ImagePage": (context) {return new ImagePage();},
  "/CheckboxPage": (context) {return new CheckboxPage();},
  "/RadioPage": (context) {return new RadioPage();},
  "/SwitchPage": (context) {return new SwitchPage();},
  "/DividerPage": (context) {return new DividerPage();},
  "/FormPage": (context) {return new FormPage();},
  "/TextFieldPage": (context) {return new TextFieldPage();},
  "/InkWellPage": (context) {return new InkWellPage();},
  "/StepperPage": (context) {return new StepperPage();},
  "/ProgressPage": (context) {return new ProgressPage();},
  "/SliderPage": (context) {return new SliderPage();},
  "/RefreshIndicatorPage": (context) {return new RefreshIndicatorPage();},
  "/PlaceholderPage": (context) {return new PlaceholderPage();},
  "/ShowDatePickerPage": (context) {return new ShowDatePickerPage();},
  "/IconPage": (context) {return new IconPage();},
  "/FlutterLogoPage": (context) {return new FlutterLogoPage();},
  "/TooltipPage": (context) {return new TooltipPage();},
  "/OpacityPage": (context) => OpacityPage(),
  "/ClipPage": (context) => ClipPage(),
  "/BoxDecorationPage": (context) => BoxDecorationPage(),
  "/ChipPage": (context) => ChipPage(),
  "/BannerPage": (context) => BannerPage(),
  "/BackdropFilterPage": (context) => BackdropFilterPage(),
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