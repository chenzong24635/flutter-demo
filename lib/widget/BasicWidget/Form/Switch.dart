import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//[Switch](https://docs.flutter.io/flutter/material/Switch-class.html)
//[SwitchListTile](https://docs.flutter.io/flutter/material/SwitchListTile-class.html)
/*
作用：开关按钮

继承：
Object > Diagnosticable > DiagnosticableTree > Widget > StatefulWidget > Switch
Object > Diagnosticable > DiagnosticableTree > Widget > StatefulWidget > SwitchListTile

构造函数：（类型 属性 = 默认值）
const Switch({
  Key key,
  @required this.value, // 是否打开
  @required this.onChanged,// 当打开关闭的时候的回调
  this.activeColor, // 打开时 滑块的颜色
  this.activeTrackColor, // 打开时 滑道的颜色
  this.inactiveThumbColor,
  this.inactiveTrackColor,
  this.activeThumbImage, //打开时 滑块的背景图
  this.inactiveThumbImage,
  this.materialTapTargetSize,
  this.dragStartBehavior = DragStartBehavior.start,
  this.focusColor,
  this.hoverColor,
  this.focusNode,
  this.autofocus = false,
})

  const SwitchListTile.adaptive({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.title,
    this.subtitle,
    this.isThreeLine = false, // 是不是三行， true 时： subtitle 不能为null， false时可以为 null
    this.dense, // 是否垂直密集居中
    this.contentPadding,
    this.secondary, //左侧图标
    this.selected = false, // 如果为 true ，则 text 和 icon 都用 activeColor 时的color
  }) 
*/

class SwitchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Switch SwitchListTile'),),
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
  bool valuec = true;
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
          Text('IOS风格的开关'),
          CupertinoSwitch(
            value: this.valueb,
            onChanged: (bool value) {
              setState(() {
                this.valueb = value;
              });
            },
          ),
          SwitchListTile(
            value: valuec,
            onChanged: (val){
              setState(() {
                valuec = val;
              });
            },
            activeColor: Colors.red,
            activeTrackColor: Colors.black,
            activeThumbImage: AssetImage("images/a.jpg"),
            inactiveThumbColor: Colors.green,
            inactiveTrackColor: Colors.amberAccent,
            inactiveThumbImage: AssetImage("images/th.jpg"),
            title: Text("标题"),
            subtitle: Text("副标题"),
            isThreeLine: true,
            // selected: true,
            dense: true,
            secondary: Icon(Icons.access_time),
          ),
      ],
    );
  }
}