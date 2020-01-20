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

enum MySex { Man, Women }

class _RadioPageState extends State<RadioPage> {
  MySex _character = MySex.Women;
  var name = 'A';
  var subject = '数学';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Radio RadioListTile'),),
      body:  Column(
        children: <Widget>[
          ListTile(
            title: Text('男'),
            leading: Radio(
              value: MySex.Man,
              autofocus: true,
              groupValue: _character,
              activeColor: Colors.red,
              focusColor: Colors.green,
              hoverColor: Colors.amber,
              onChanged: (MySex value) {
                setState(() { _character = value; print(value);});
              },
            ),
          ),
          ListTile(
            title: const Text('女'),
            leading: Radio(
              value: MySex.Women,
              groupValue: _character,
              onChanged: (MySex value) {
                setState(() { _character = value; print(value);});
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('A'),
            leading: Radio(
              value: 'A',
              groupValue: this.name,
              activeColor: Colors.amber,
              onChanged: (value) {
                setState(() { this.name = value; print(value);});
              },
            ),
          ),
          ListTile(
            title: const Text('B'),
            leading: Radio(
              value: 'B',
              groupValue: this.name,
              onChanged: (value) {
                setState(() { this.name = value; print(value);});
              },
            ),
          ),
          Divider(),
          Text('RadioListTile',style:TextStyle(fontSize: 20.0)),
          SizedBox(height: 10.0,),
          RadioListTile(
            value: "语文",
            groupValue: this.subject,
            activeColor: Colors.greenAccent,
            title: Text("语文"),
            subtitle: Text("Chinese"),
            // isThreeLine:true,  //三行展示，显示为顶层
            secondary: Image.asset("images/th.jpg"),
            onChanged: (value) {
              setState(() { this.subject = value; print(value);});
            },
            // selected: false, //选中后文字高亮，默认false
            // dense: true, //使文本更小，并将所有内容打包在一起
            controlAffinity: ListTileControlAffinity.leading
            //leading：secondary在右侧；trailing：secondary在左侧；platform：根据平台确定
          ),
          RadioListTile(
            value: "数学",
            groupValue: this.subject,
            activeColor: Colors.greenAccent,
            title: Text("数学"),
            subtitle: Text("Math"),
            secondary: Image.asset("images/a.jpg"),
            onChanged: (value) {
              setState(() { this.subject = value; print(value);});
            },
            controlAffinity: ListTileControlAffinity.leading
          ),
        ],
      ),
    );
  }
}