import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';


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
        body: Tooltip(
          message:'daad',
          child: Text('fsfsd')
        )
      );
  }
}