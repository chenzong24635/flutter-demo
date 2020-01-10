import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';

import './SnackBar.dart';
import './BottomSheet.dart';
import './SimpleDialog.dart';
import './AlertDialog.dart';
import './AlertDialog1.dart';
import './AlertDialog2.dart';
import './AlertDialog_Loading.dart';
import './Customize.dart';
import '../IOSWidget/CupertinoAlertDialog.dart';
import '../IOSWidget/CupertinoActionSheet.dart';
import '../IOSWidget/CupertinoActivityIndicator.dart';
import '../IOSWidget/CupertinoContextMenu.dart';
import '../IOSWidget/CupertinoDatePicker.dart';

//[对话框详解](https://book.flutterchina.club/chapter7/dailog.html)

// AlertDialog和SimpleDialog都使用了Dialog类

//[Dialog](https://api.flutter.dev/flutter/material/Dialog-class.html)


class AlertPage extends StatefulWidget {
  AlertPage({Key key}) : super(key: key);

  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  List _list = ["分享", "选择", "收藏"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('弹窗 交互'),
        actions: <Widget>[
          PopupMenuButton(
            child: Icon(Icons.more), //点击此子Widget，显示菜单
            //选择的事件
            onSelected: (val) {
              print(val); //value值
            },
            itemBuilder: (ctx) {
              var list = new List<PopupMenuEntry>();
              for (int i = 0; i < _list.length; i++) {
                if (i != _list.length - 1) {
                  list.addAll([
                    //菜单项
                    PopupMenuItem(child: Text(_list[i]), value: _list[i]),
                    //下划线
                    PopupMenuDivider(
                      height: 1.0,
                    )
                  ]);
                } else {
                  list.addAll([
                    //菜单项
                    PopupMenuItem(
                      child: Text(_list[i]),
                      value: _list[i],
                    )
                  ]);
                }
              }
              print(list);
              return list.toList();
            }
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Dialog(
                child: Text('我是一个Dialog')
              ),
              SimpleDialogPage(),
              AlertDialogPage(),
              CupertinoAlertDialogPage(),
              AlertDialogLoadingPage(),
              CupertinoActivityIndicatorPage(), //IOS loading
              AlertDialogPage1(),
              AlertDialogPage2(),
              ShowSnackBar(),
              ShowModalBottomSheetPage(),
              CupertinoActionSheetPage(),
              CupertinoContextMenuPage(),
              CustomizePage(),
              CupertinoDatePickerPage(),
            ],
          )],
      ),
    );
  }
}
