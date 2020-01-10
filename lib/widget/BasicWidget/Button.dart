import "package:flutter/material.dart";

import '../LayoutWidget/ButtonBar.dart';
import '../IOSWidget/CupertinoButton.dart';

//[RaisedButton](https://api.flutter.dev/flutter/widgets/RaisedButton-class.html)
/*
用法：
Material 组件库中提供了多种按钮组件如RaisedButton、FlatButton、OutlineButton
都有如下相同点：
  按下时都会有“水波动画”（又称“涟漪动画”，就是点击时按钮上会出现水波荡漾的动画）。
  有一个onPressed属性来设置点击回调，当按钮按下时会执行该回调，如果不提供该回调则按钮会处于禁用状态，禁用状态不响应用户点击。

继承： 
Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > MaterialButton  > RaisedButton
                                                                                          > FlatButton
                                                                                          > OutlineButton
                                                                                          > IconButton

构造函数：（类型 属性 = 默认值）
const RaisedButton({
  Key key,
  @required VoidCallback onPressed, // 点击回调，必须值
  VoidCallback onLongPress, // 长按回调
  ValueChanged<bool> onHighlightChanged,

  ButtonTextTheme textTheme, // 文本主题
  Color textColor, // 文字颜色
  Color disabledTextColor, // 禁用时文字颜色

  Color color, // 背景色
  Color disabledColor, // 禁用时背景色
  Color focusColor, // 聚焦时背景色
  Color hoverColor, // 悬停时背景色
  Color highlightColor, // 按钮按下时的背景色
  Color splashColor, // 点击时，水波动画中水波的颜色
  Brightness colorBrightness, //按钮主题，默认是浅色主题 

  double elevation, // 阴影
  double focusElevation,
  double hoverElevation,
  double highlightElevation,
  double disabledElevation,

  EdgeInsetsGeometry padding,
  ShapeBorder shape, // 外形
  Clip clipBehavior = Clip.none, // 内容裁剪
  FocusNode focusNode, // 一个可选的焦点节点
  bool autofocus = false, // 是否自动聚焦
  MaterialTapTargetSize materialTapTargetSize,
  Duration animationDuration,
  Widget child,
}) 

*/

class ButtonPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Button')),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            hoverColor : Colors.red,
            autofocus: true,
            textColor: Colors.white,
            color: Colors.blueAccent,
            splashColor: Colors.red,
            highlightColor: Colors.green,
            disabledElevation: 2.0,
            // disabledColor: Colors.orange,
            // disabledTextColor: Color(0xoffaadd4),
            // colorBrightness: ,
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(10),
              ),
            ), 
            elevation: 15.0,
            onPressed: () {},
            child: Text("自定义的按钮外观"),
          ),
          H15,
          Divider(),
          Text('RaisedButton 即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大',style:TextStyle(fontSize: 18.0)),
          RaisedButton(
            child: Text("RaisedButton 漂浮按钮"),
            onPressed: () {},
            onLongPress: () {},
          ),
          H15,
          Divider(),
          Text('FlatButton 即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色。',style:TextStyle(fontSize: 18.0)),
          FlatButton(
            onPressed: () {},
            child: Text("FlatButton 扁平化按钮"),
          ),
          H15,
          Divider(),
          Text('OutlineButton 默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)，'),
          OutlineButton(
            
            onPressed: () {},
            child: Text("OutlineButton 带边框按钮"),
          ),
          H15,
          Divider(),
          Text('IconButton 可点击的Icon，不包括文字，默认没有背景，点击后会出现背景',style:TextStyle(fontSize: 18.0)),
          IconButton(
            iconSize: 50.0,
            icon: Icon(Icons.add),
            color: Colors.orange,
            splashColor: Colors.red,
            highlightColor: Colors.black,
            onPressed: () {
            },
          ),
          H15,
          Divider(),
          Text('带图标的按钮',style:TextStyle(fontSize: 18.0)),
          RaisedButton.icon(
            icon: Icon(Icons.send),
            label: Text("发送"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ButtonBarPage()));
            },
          ),
          RaisedButton(
            child: Text("ButtonBar 一行按钮组"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ButtonBarPage()));
            },
          ),
          H15,
          Divider(),
          Center(child: Text('IOS风格的按钮',style:TextStyle(fontSize: 20.0)),),
          CupertinoButtonPage(),
          H15
        ],
      )
    );
  }
}
Widget H15 = SizedBox(height: 15.0,);