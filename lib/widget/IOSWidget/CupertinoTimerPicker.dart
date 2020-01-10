import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//https://api.flutter.dev/flutter/cupertino/CupertinoTimerPicker-class.html
//IOS风格 时间选择
class CupertinoTimerPickerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: 20.0,),
      Divider(),
      Text('IOS 时间选择器',style:TextStyle(fontSize: 20.0)),
      time1,
    ],);
  }
}

Widget time1 = Container(
  height: 300,
  child: CupertinoTimerPicker(
    mode: CupertinoTimerPickerMode.hms,
    onTimerDurationChanged: (value) {
    }
  ),
);