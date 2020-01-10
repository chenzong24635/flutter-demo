import 'package:flutter/material.dart';

class DismissiblePage extends StatefulWidget {
  DismissiblePage({Key key}) : super(key: key);

  @override
  _DismissiblePageState createState() => _DismissiblePageState();
}

class _DismissiblePageState extends State<DismissiblePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Text(''),
    );
  }
}