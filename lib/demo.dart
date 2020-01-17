import 'package:flutter/material.dart';


class DemoPage extends StatefulWidget {
  DemoPage({Key key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text(''),),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text('QTY:', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
          Icon(
              Icons.minimize
            ),
          Baseline(
            baseline: 12.0,
            baselineType: TextBaseline.ideographic,
            child: Icon(
              Icons.minimize
            ),
          ),
          Text('ABNfscfs:', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
        ]),
    );
  }
}