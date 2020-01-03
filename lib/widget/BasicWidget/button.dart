import "package:flutter/material.dart";

//[Flutter实战](https://book.flutterchina.club/chapter3/buttons.html)
//[官网](https://api.flutter.dev/flutter/widgets/Button-class.html)
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

构造函数：（类型 属性 = 默认值）

FlatButton(
  Color textColor, //按钮文字颜色
  Color color, //按钮背景色
  Color splashColor, //点击时，水波动画中水波的颜色
  Color highlightColor, //按钮按下时的背景色
  double elevation, // 阴影
  EdgeInsetsGeometry padding, //padding
  ShapeBorder shape, //外形
  Duration animationDuration, //

  onPressed, //(@required) 点击回调 
  onLongPress, //(@required) 长按回调 
  Widget child, //(@required)

  Color hoverColor //指针悬停时的背景色
  double hoverElevation // 指针悬停时的阴影

  bool enableFeedback, // 检测到的手势是否应提供听觉和/或触觉反馈
  Brightness colorBrightness,//按钮主题，默认是浅色主题 

  bool autofocus = false //是否为焦点
  double focusElevation, //按钮具有输入焦点时的阴影
  Color focusColor  = false //当按钮具有输入焦点时，其“材质”的填充颜色。
  FocusNode focusNode, //一个可选的焦点节点

  Color disabledTextColor, //按钮禁用时的文字颜色
  Color disabledColor,//按钮禁用时的背景颜色
  double disabledElevation, //禁用时的阴影
  int hashCode, // 哈希码
  ....
)
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
          Padding(padding:EdgeInsets.all(10)),
          Divider(),
          Text('RaisedButton 即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大',style:TextStyle(fontSize: 18.0)),
          RaisedButton(
            child: Text("RaisedButton 漂浮按钮"),
            onPressed: () {},
            onLongPress: () {},
          ),
          Padding(padding:EdgeInsets.all(10)),
          Divider(),
          Text('FlatButton 即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色。',style:TextStyle(fontSize: 18.0)),
          FlatButton(
            onPressed: () {},
            child: Text("FlatButton 扁平化按钮"),
          ),
          Padding(padding:EdgeInsets.all(10)),
          Divider(),
          Text('OutlineButton 默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)，'),
          OutlineButton(
            
            onPressed: () {},
            child: Text("OutlineButton 带边框按钮"),
          ),
          Padding(padding:EdgeInsets.all(10)),
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
          Padding(padding:EdgeInsets.all(10)),
          Divider(),
          Text('带图标的按钮',style:TextStyle(fontSize: 18.0)),
          RaisedButton.icon(
            icon: Icon(Icons.send),
            label: Text("发送"),
            onPressed: () {},
          ),
          OutlineButton.icon(
            icon: Icon(Icons.add),
            label: Text("添加"),
            onPressed: () {},
          ),
          FlatButton.icon(
            icon: Icon(Icons.info),
            label: Text("详情"),
            onPressed: () {},
          ),
          Padding(padding:EdgeInsets.all(10)),
          Divider(),
          RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.all(100.0),
                    child:Text('我是个底部弹窗')
                  );
                }
              );
            },
            child: Text("点我显示底部弹窗 showModalBottomSheet"),
          ),
          RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(100.0),
                    color: Colors.white,
                    child:Text('Dialog content..',style:TextStyle(fontSize: 16.0))
                  );
                }
              );
            },
            child: Text("点我显示Dialog弹窗--普通"),
          ),
          RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: Text("我是一个 SimpleDialog"), // 标题
                    titlePadding: EdgeInsets.all(10.0),
                    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0), // 内容padding
                    backgroundColor: Colors.amber,
                    elevation: 1.0,//悬浮高度，和阴影效果有关
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))), // 边框形状
                    children: <Widget>[
                      ListTile(
                        title: Center(child: Text("Item_1"),),
                      ),
                      ListTile(
                        title: Center(child: Text("Item_2"),),
                      ),
                      ListTile(
                        title: Center(child: Text("Item_3"),),
                      ),
                      RaisedButton(
                        child: Text("Close"),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                }
              );
            },
            child: Text("点我显示Dialog弹窗--SimpleDialog"),
          ),
          RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('我是一个 AlertDialog'),
                  content: Text(('Dialog content..')),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("取消"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    new FlatButton(
                      child: new Text("确定"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              );
            },
            child: Text("点我显示Dialog弹窗--AlertDialog"),
          ),
        ],
      )
    );
  }
}