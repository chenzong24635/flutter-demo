import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//https://api.flutter.dev/flutter/cupertino/CupertinoTabBar-class.html

class CupertinoTabBarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.circle),
      title: Text('Tab 1'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.add),
      title: Text('Tab 2'),
    ),
  ],
  currentIndex: 1,
);
  }
}