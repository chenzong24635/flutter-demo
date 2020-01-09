import 'package:flutter/material.dart';
//[showDatePicker](https://api.flutter.dev/flutter/material/showDatePicker.html)
/*
作用：日期&时间选择器
打开的面板样式是系统自带的

默认是英文说明的，就算手机设置为中文。如果需要是中文说明，则需要自己做 国际化 处理。

继承：

构造函数：（类型 属性 = 默认值）

*/

class ShowDatePickerPage extends StatelessWidget {
  const ShowDatePickerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('日期选择'),),
      body: Wrap(
        children: <Widget>[
          RaisedButton(
            child: new Text('选择日期'),
            onPressed: () {
              // 调用函数打开
              showDatePicker(
                  context: context,
                  initialDate: new DateTime.now(),
                  firstDate: new DateTime.now().subtract(new Duration(days: 30)), // 减 30 天
                  lastDate: new DateTime.now().add(new Duration(days: 30)),       // 加 30 天
              ).then((DateTime val) {
                  print(val);   // 2018-07-12 00:00:00.000
              }).catchError((err) {
                  print(err);
              });
            },
          ),
          RaisedButton(
            child: new Text('选择时间'),
            onPressed: () {
              // 调用函数打开
              showTimePicker(
                  context: context,
                  initialTime:  new TimeOfDay.now(), 
              ).then((val) {
                  print(val);
              }).catchError((err) {
                  print(err);
              });
            },
          ),
        ]
      ),
    );
  }
}