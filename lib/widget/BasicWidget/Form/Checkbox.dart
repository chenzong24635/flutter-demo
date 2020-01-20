import "package:flutter/material.dart";

//[Checkbox](https://api.flutter.dev/flutter/material/Checkbox-class.html)
//[CheckboxListTile](https://api.flutter.dev/flutter/material/CheckboxListTile-class.html)
/*
作用：复选框

继承：
Object > Diagnosticable > DiagnosticableTree > Widget > StatefulWidget > Checkbox
Object > Diagnosticable > DiagnosticableTree > Widget > StatefulWidget > CheckboxListTile

构造函数：（类型 属性 = 默认值）

const Checkbox({
  Key key,
  @required this.onChanged,
  @required bool value, // 是否选中此复选框
  bool tristate = false, // 是否为三态,为true时，value的值会增加一个状态null
  Color activeColor, // 选中时的颜色
  Color checkColor, // 选中时 选中图标的颜色
  Color hoverColor, // 指针悬停时的颜色
  Color focusColor, // 具有输入焦点时的颜色
  bool autofocus = false, // 是否自动聚焦
  FocusNode focusNode, // 一个可选的焦点节点
  MaterialTapTargetSize materialTapTargetSize, // 配置点击目标的最小大小
})
*/

class CheckboxPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkbox CheckboxListTile'),),
      body: CheckBox()
    );
  }
}

class CheckBox extends StatefulWidget {
  @override
  _CheckBoxState createState() => new _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool valuea = false;
  bool valueb = false;
  bool valuec = false;
  bool valued = false;

  bool _checkboxSelected = false; //复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Checkbox(
          autofocus: true,
          value: _checkboxSelected,
          activeColor: Colors.red, 
          tristate: true,
          materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
          onChanged:(value){
            setState(() {
              _checkboxSelected = value;
            });
          } ,
        ),
        Text('$_checkboxSelected'),
        Padding(padding:EdgeInsets.all(15.0)),
        Text('Checkbox的大小是固定的，无法自定义',style:TextStyle(fontSize: 20.0)),
        Row(
          children: <Widget>[
            SizedBox(width: 10,),
            Text('简单复选框：'),SizedBox(width: 20,),
            Checkbox(
              checkColor: Colors.yellowAccent,
              activeColor: Colors.red,
              value: this.valuea,
              onChanged: (bool value) {
                setState(() {
                  this.valuea = value;
                });
              },
            ),
            Checkbox(
              value: this.valueb,
              onChanged: (bool value) {
                setState(() {
                  this.valueb = value;
                });
              },
            ),
          ],
        ),
        SizedBox(height: 40.0,),
        Text('CheckboxListTile用法',style:TextStyle(fontSize: 22.0)),
        CheckboxListTile(
          secondary: const Icon(Icons.alarm),
          title: const Text('每天6：00 响铃'),
          subtitle: Text('12小时48分钟后响铃'),
          value: this.valuec,
          onChanged: (bool value) {
            setState(() {
              this.valuec = value;
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.trailing,
          secondary: const Icon(Icons.alarm_on),
          title: const Text('每天6：10 响铃'),
          subtitle: Text('12小时58分钟后响铃'),
          value: this.valued,
          onChanged: (bool value) {
            setState(() {
              this.valued = value;
            });
          },
        ),
      ],
    );
  }
}