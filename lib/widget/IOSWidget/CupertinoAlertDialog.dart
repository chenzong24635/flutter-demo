import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//https://api.flutter.dev/flutter/cupertino/CupertinoAlertDialog-class.html

class CupertinoAlertDialogPage extends StatefulWidget {
  CupertinoAlertDialogPage({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<CupertinoAlertDialogPage> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _showIOSDialog(context).then((value) {
          print("对话框消失:$value");
        });
      },
      child: Text(
        'AlertDialog-IOS风格',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

//需要导入cupertino
_showIOSDialog(BuildContext context) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return new CupertinoAlertDialog(
        title: new Text("title"),
        content: new Text("内容内容内容内容内容内容内容内容内容内容内容"),
        actions: <Widget>[
          new CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop("点击了确定");
            },
            child: new Text("确认"),
          ),
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop("点击了取消");
            },
            child: new Text("取消"),
          ),
        ],
      );
    }
  );
}