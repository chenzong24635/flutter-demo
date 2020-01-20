import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; //国际化

//[showDatePicker](https://api.flutter.dev/flutter/material/showDatePicker.html)
/*
作用：日期&时间选择器
打开的面板样式是系统自带的

默认是英文说明的，就算手机设置为中文。如果需要是中文说明，则需要自己做 国际化 处理:
1. 找到pubspec.yaml配置flutter_localizations：
  dependencies:
    flutter:
      sdk: flutter
    flutter_localizations:
      sdk: flutter

2.导入国际化的包 flutter_localizations：
  import 'package:flutter_localizations/flutter_localizations.dart'; 

3.设置国际化:MaterialApp中添加:
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: [
    const Locale('zh', 'CH'),
    const Locale('en', 'US'),
  ]

4. 要显示中文的控件设置：
showDatePicker提供了locale参数，如果有需要可以继续更改。添加 locale: Locale('zh'),  
showTimePicker没有提供locale参数,


继承：

构造函数：（类型 属性 = 默认值）

*/

class ShowDatePickerPage extends StatelessWidget {
  var time1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('日期&时间选择器'),),
      body: Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.center,
        children: <Widget>[
          OutlineButton(
            child: new Text('日历选择器'),
            onPressed: () {
              _datePicker1(context);
            },
          ),
          OutlineButton(
            child: new Text('日历选择器-IOS风格'),
            onPressed: () {
              _datePicker2(context);
            },
          ),
          OutlineButton(
            child: new Text('选择时间'),
            onPressed: () {
              _timePicker(context);
            },
          ),
          OutlineButton(
            child: new Text('选择时间'),
            onPressed: () {
              _timePicker(context);
            },
          ),
        ]
      ),
    );
  }
}

//日期选择
_datePicker1(BuildContext context){
  // 调用函数打开
  var date = DateTime.now();
  showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date.subtract(Duration(days: 30)), // 前 30天可选
      lastDate: date.add(Duration(days: 30)), //后 30天可选
      locale: Locale('zh'),//中文
  ).then((DateTime val) {
      print(val);   // 2018-07-12 00:00:00.000
  }).catchError((err) {
      print(err);
  });
}

//时间选择
_timePicker(BuildContext context){
  // 调用函数打开
  showTimePicker(
    context: context,
    initialTime:  new TimeOfDay.now(), 
  ).then((times) {
      print('当前选择了：${times.hour}时${times.minute}分');
  }).catchError((err) {
      print(err);
  });
}
//时间选择-中文 ？？？
_timePicker1(BuildContext context){
  showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (BuildContext context, Widget child) {
      return Localizations(
          locale: const Locale('zh'),
          child: child,
          delegates: <LocalizationsDelegate>[
              // GlobalMeterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
          ]
      );
    }
  );
}

//日期选择-IOS风格
Future<DateTime> _datePicker2(BuildContext context) {
  var date = DateTime.now();
  return showCupertinoModalPopup(
    context: context,
    builder: (ctx) {
      return SizedBox(
        height: 200,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: date,
          maximumDate: date.add(
            Duration(days: 30),
          ),
          maximumYear: date.year + 1,
          onDateTimeChanged: (DateTime value) {
            return value;
            // print(value);
          },
        ),
      );
    },
  );
}
