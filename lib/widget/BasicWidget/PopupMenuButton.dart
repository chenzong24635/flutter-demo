import 'package:flutter/material.dart';

//[](https://api.flutter.dev/flutter/material/PopupMenuButton-class.html)
/*
作用：
  按下时显示菜单，
  并因为选择了某个项目而将其关闭，则调用onSelected。
  传递给onSelected的值是所选菜单项的值。

继承：

构造函数：（类型 属性 = 默认值）

*/
class PopupMenuButtonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PopupMenuButtonState();
}

const List<String> models = const <String>['A', 'B', 'C'];

class _PopupMenuButtonState extends State<PopupMenuButtonPage> {
  String title = 'PopupMenuButton';

  List<PopupMenuEntry<String>> _getItemBuilder() {
    return models
      .map((item) => PopupMenuItem<String>(
        child: Text(item),
        value: item,//value一定不能少
      ))
      .toList();
  }

  void _select(String value) {
    setState(() {
      title = value;
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return _getItemBuilder();
            },
          )
        ],
      ),
      body: Center(child: Text('点击右上角 切换标题',style: TextStyle(fontSize: 22.0)),),
    );
  }
}