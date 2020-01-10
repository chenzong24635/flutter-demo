import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//https://api.flutter.dev/flutter/cupertino/CupertinoContextMenu-class.html

//IOS风格 当长按时，将打开一个全屏模式通道。
class CupertinoContextMenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      child: RaisedButton(child: Text('长按显示'),onPressed: (){},),
      actions: <Widget>[
        CupertinoContextMenuAction(
          child: const Text('Action one'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoContextMenuAction(
          child: const Text('Action two'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}