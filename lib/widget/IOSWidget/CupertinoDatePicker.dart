import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//https://api.flutter.dev/flutter/cupertino/CupertinoDatePicker-class.html
//IOS风格 日历选择
class CupertinoDatePickerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: 20.0,),
      Divider(),
      Text('IOS 日历选择器',style:TextStyle(fontSize: 20.0)),
      date1,
    ],);
  }
}

Widget date1 = Container(
  height: 300,
  child: CupertinoDatePicker(
    mode: CupertinoDatePickerMode.dateAndTime,
    onDateTimeChanged: (dateTime) {
    }
  ),
);