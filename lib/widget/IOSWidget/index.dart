import 'package:flutter/material.dart';

import 'package:flutter1/main.dart';

import './CupertinoActionSheet.dart';
import './CupertinoActivityIndicator.dart';
import './CupertinoAlertDialog.dart';
import './CupertinoButton.dart';
import './CupertinoSwitch.dart';
import './CupertinoContextMenu.dart';
import './CupertinoDatePicker.dart';
import './CupertinoTimerPicker.dart';
import './CupertinoNavigationBar.dart';
import './CupertinoPageScaffold.dart';
import './CupertinoSlider.dart';
import './CupertinoTabBar.dart';


class IOSWidget extends StatefulWidget {
  IOSWidget({Key key}) : super(key: key);

  @override
  _IOSWidgetState createState() => _IOSWidgetState();
}

class _IOSWidgetState extends State<IOSWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IOS风格'),),
      body:ListView(children: <Widget>[
        CupertinoTabBarPage(),
        h20,
        RaisedButton(
          child: Text('CupertinoPageScaffold',style: TextStyle(fontSize: 20.0),),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CupertinoPageScaffoldPage()));
          },
        ),
        h20,
        CupertinoNavigationBarPage(),
        h20,
        CupertinoButtonPage(),
        CupertinoSwitchPage(),
        h20,
        CupertinoActionSheetPage(),
        CupertinoAlertDialogPage(),
        h20,
        Center(child: Text('loading',style: TextStyle(fontSize: 20.0),),),
        CupertinoActivityIndicatorPage(),
        h20,
        CupertinoSliderPage(),
        h20,
        CupertinoContextMenuPage(),
        h20,
        CupertinoTimerPickerPage(),
        CupertinoDatePickerPage(),
        h20,
      ],),
    );
  }
}

Widget h20 = SizedBox(height: 20.0,);