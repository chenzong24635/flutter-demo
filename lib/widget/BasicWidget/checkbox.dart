import "package:flutter/material.dart";

class CheckboxSwitchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkbox Switch'),),
      body: SwitchAndCheckBox()
    );
  }
}

class SwitchAndCheckBox extends StatefulWidget {
  @override
  _SwitchAndCheckBoxState createState() => new _SwitchAndCheckBoxState();
}

class _SwitchAndCheckBoxState extends State<SwitchAndCheckBox> {
  bool _switchSelected = true; //单选开关状态
  bool _checkboxSelected = true; //复选框状态
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
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          tristate: true,// 是否为三态,为true时，value的值会增加一个状态null
          onChanged:(value){
            setState(() {
              _checkboxSelected = value;
            });
          } ,
        ),
        Text('${_checkboxSelected}'),
        Padding(padding:EdgeInsets.all(15.0)),
        Text('Checkbox的大小是固定的，无法自定义',style:TextStyle(fontSize: 20.0)),
        Text('Switch只能定义宽度，高度也是固定的',style:TextStyle(fontSize: 20.0)),
      ],
    );
  }
}