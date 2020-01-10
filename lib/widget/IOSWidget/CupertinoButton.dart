import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//https://api.flutter.dev/flutter/cupertino/CupertinoButton-class.html
//IOS 按钮
class CupertinoButtonPage extends StatelessWidget {
  const CupertinoButtonPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CupertinoButton(
            child: Text('Button'),
            onPressed: () { /** */ },
          ),
          CupertinoButton.filled(
            child: Text('Button'),
            onPressed: () { /** */ },
          ),
        ],
      ),
    );
  }
}