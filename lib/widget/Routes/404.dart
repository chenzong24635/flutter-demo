import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Error'),),
      body: Center(
        child: Text('Error 页面,处理未知、不存在的路由',style: TextStyle(fontSize: 22),),
      )
    );
  }
}