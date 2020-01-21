import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class DemoPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
      ///定义触摸层
      return Scaffold(
        appBar: AppBar(title: Text(''),),
        body: new GestureDetector(
          ///透明也响应处理
          behavior: HitTestBehavior.translucent,
          onTap: () {
            ///触摸手气键盘
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: new Container(
            child: Text('adsa'),
          ),
        ),
      );
  }
}