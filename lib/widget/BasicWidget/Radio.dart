import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//[官网](https://api.flutter.dev/flutter/material/Radio-class.html)
/*
作用：单选框

继承：
Object > Diagnosticable > DiagnosticableTree > Widget > StatefulWidget > Radio

构造函数：（类型 属性 = 默认值）
const Radio({
  Key key,
  @required value, 
  @required groupValue,
  @required onChanged, // 改变回调
  this.activeColor, // 选中的颜色
  this.focusColor,
  this.hoverColor,
  this.materialTapTargetSize,
  this.focusNode,
  this.autofocus = false,
})
*/

class RadioPage extends StatefulWidget {
  RadioPage({Key key}) : super(key: key);

  @override
  _RadioPageState createState() => _RadioPageState();
}

enum MyRadios { A, B }

class _RadioPageState extends State<RadioPage> {
MyRadios _character = MyRadios.B;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Radio'),),
      body:  Column(
        children: <Widget>[
          ListTile(
            title: Text('A'),
            leading: Radio(
              value: MyRadios.A,
              autofocus: true,
              groupValue: _character,
              activeColor: Colors.red,
              focusColor: Colors.green,
              hoverColor: Colors.amber,
              onChanged: (MyRadios value) {
                setState(() { _character = value; print(value);});
              },
            ),
          ),
          ListTile(
            title: const Text('B'),
            leading: Radio(
              value: MyRadios.B,
              groupValue: _character,
              onChanged: (MyRadios value) {
                setState(() { _character = value; print(value);});
              },
            ),
          ),
        ],
      ),
    );
  }
}