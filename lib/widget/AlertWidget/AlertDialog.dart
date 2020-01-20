import 'package:flutter/material.dart';

//[showDialog](https://api.flutter.dev/flutter/material/showDialog.html)
//[AlertDialog](https://api.flutter.dev/flutter/material/AlertDialog-class.html)
/*
作用：弹窗 交互

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > AlertDialog

构造函数：（类型 属性 = 默认值）
const AlertDialog({
  Key key,
  this.title, //对话框标题组件
  this.titlePadding, // 标题填充
  this.titleTextStyle, //标题文本样式
  this.content, // 对话框内容组件
  this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0), //内容的填充
  this.contentTextStyle,// 内容文本样式
  this.actions, // 对话框操作按钮组
  this.backgroundColor, // 对话框背景色
  this.elevation,// 对话框的阴影
  this.semanticLabel, //对话框语义化标签(用于读屏软件)
  this.shape, // 对话框外形
})
*/

class AlertDialogPage extends StatefulWidget {
  AlertDialogPage({Key key}) : super(key: key);

  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _showDialog(context).then((val) {
          print('点击了$val');
        });
      },
      child: Text(
        'AlertDialog-Material风格',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

_showDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('提示'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('You will never be satisfied.'),
            Text('You\’re like me. I’m never satisfied.'),
            Text('You\’re like me. I’m never satisfied.'),
            Text('You\’re like me. I’m never satisfied.'),
            Text('You\’re like me. I’m never satisfied.'),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            //关闭对话框
            Navigator.of(context).pop('取消');
          },
          child: Text('取消')
        ),
        FlatButton(
          onPressed: () {
            //关闭对话框
            Navigator.of(context).pop('确定');
          },
          child: Text('确定')
        )
      ],
    )
  );
}