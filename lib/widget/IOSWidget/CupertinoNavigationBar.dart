import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//https://api.flutter.dev/flutter/cupertino/CupertinoNavigationBar-class.html
//IOS风格 头部返回栏
//通常和CupertinoPageScaffold一起使用
class CupertinoNavigationBarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return bar;
  }
}
Widget bar = CupertinoNavigationBar(
  leading: CupertinoNavigationBarBackButton(
    previousPageTitle: 'Home',
    onPressed: () {},
  ),
  middle: const Text('CupertinoNavigationBar Sample'),
);