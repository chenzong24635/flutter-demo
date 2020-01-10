import 'package:flutter/material.dart';

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