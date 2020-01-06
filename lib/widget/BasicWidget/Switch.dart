import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//[Switch](https://api.flutter.dev/flutter/widgets/Switch-class.html)
/*
作用：开关按钮

继承：
Object > Diagnosticable > DiagnosticableTree > Widget > StatefulWidget > Switch

构造函数：（类型 属性 = 默认值）
const Switch({
  Key key,
  @required this.value, // 是否打开
  @required this.onChanged,
  this.activeColor, //打开时的颜色
  this.activeTrackColor,
  this.inactiveThumbColor,
  this.inactiveTrackColor,
  this.activeThumbImage, //打开时的背景图
  this.inactiveThumbImage, //关闭时的背景图
  this.materialTapTargetSize,
  this.dragStartBehavior = DragStartBehavior.start,
  this.focusColor,
  this.hoverColor,
  this.focusNode,
  this.autofocus = false,
})

*/

class SwitchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkbox Switch'),),
      body: SwitchBox()
    );
  }
}

class SwitchBox extends StatefulWidget {
  @override
  _SwitchBoxState createState() => new _SwitchBoxState();
}

class _SwitchBoxState extends State<SwitchBox> {
  bool valuea = false;
  bool valueb = false;
  bool _switchSelected = true; //单选开关状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,//当前状态
          activeColor: Colors.green, //选中时的颜色
          onChanged:(value){
            //重新构建页面  
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Text("$_switchSelected, ${_switchSelected ? '开' : '关'}"),
        Switch(
            activeColor:Colors.red,
            activeTrackColor:Colors.yellow,
            inactiveThumbColor:Colors.pink[200],
            inactiveTrackColor:Colors.black,
            activeThumbImage:AssetImage('images/a.jpg'),
            // inactiveThumbImage:AssetImage('images/th.jpg'),
            dragStartBehavior:DragStartBehavior.start,

            value: this.valuea,
            onChanged: (bool v) {
              setState(() {
                this.valuea = v;
              });
            },
          ),
          SizedBox(height: 30,),

          CupertinoSwitch(
            value: this.valueb,
            onChanged: (bool value) {
              setState(() {
                this.valueb = value;
              });
            },
          ),
      ],
    );
  }
}