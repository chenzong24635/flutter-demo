import 'package:flutter/material.dart';

//[](https://api.flutter.dev/flutter/material/PopupMenuButton-class.html)
/*
作用：
  菜单栏弹出按钮，
  并因为选择了某个项目而将其关闭，则调用onSelected。
  传递给onSelected的值是所选菜单项的值。

继承：

构造函数：（类型 属性 = 默认值）

*/
class PopupMenuButtonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PopupMenuButtonState();
}


class _PopupMenuButtonState extends State<PopupMenuButtonPage> {
  String title = 'PopupMenuButton';

  //菜单项
  List<String> myItems = const <String>['A', 'B', 'Cds'];

  List<PopupMenuEntry<String>> _getItemBuilder() {
    return myItems
      .map((item) => PopupMenuItem<String>(
        child: Text(item),
        value: item,//value一定不能少
      ))
      .toList();
  }
  //根据所选菜单改变title
  void _select(String value) {
    setState(() {
      title = value;
      print(value);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
        child: FlatButton(
          child: PopupMenuButton<String>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return _getItemBuilder();
            },
          ),
          onPressed: (){},
        ),
    );
  }
}