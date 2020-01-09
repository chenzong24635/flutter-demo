import 'package:flutter/material.dart';

//[bottomNavigationBar](https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html)
/*
作用：底部导航栏

继承： Object > Diagnosticable > DiagnosticableTree > Widget > StatefulWidget > BottomNavigationBar


构造函数：（类型 属性 = 默认值）
BottomNavigationBar({
  Key key,
  @required this.items,
  this.onTap,
  this.currentIndex = 0,
  this.elevation = 8.0,
  BottomNavigationBarType type,
  Color fixedColor,
  this.backgroundColor,
  this.iconSize = 24.0,
  Color selectedItemColor,
  this.unselectedItemColor,
  this.selectedIconTheme = const IconThemeData(),
  this.unselectedIconTheme = const IconThemeData(),
  this.selectedFontSize = 14.0,
  this.unselectedFontSize = 12.0,
  this.selectedLabelStyle,
  this.unselectedLabelStyle,
  this.showSelectedLabels = true,
  bool showUnselectedLabels,
})
 */

class BottomNavigationBarPage extends StatefulWidget {
  BottomNavigationBarPage({Key key}) : super(key: key);

  @override
  _BottomNavigationBarPageState createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  //当前选中项的索引
  int _selectedIndex = 1;
  
  //设置当前索引为index值
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar( // 底部导航
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
        BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
      ],
      currentIndex: _selectedIndex, //当前选中项的索引
      fixedColor: Colors.blue, //选项中项的颜色
      onTap: _onItemTapped, //选择按下处理
    );
  }
}
