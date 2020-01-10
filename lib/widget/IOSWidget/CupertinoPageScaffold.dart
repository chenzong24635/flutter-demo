import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//https://api.flutter.dev/flutter/cupertino/CupertinoPageScaffold-class.html
//IOS风格 Scaffold
class CupertinoPageScaffoldPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          previousPageTitle: 'Back',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        middle: const Text('Sample'),
      ),
      child: Center(
        child: Text('Hello!'),
      ),
    );
  }
}