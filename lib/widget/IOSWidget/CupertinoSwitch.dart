import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//https://api.flutter.dev/flutter/cupertino/CupertinoSwitch-class.html
//Switch
class CupertinoSwitchPage extends StatefulWidget {
  CupertinoSwitchPage({Key key}) : super(key: key);

  @override
  _CupertinoSwitchState createState() => _CupertinoSwitchState();
}

class _CupertinoSwitchState extends State<CupertinoSwitchPage> {
  bool myBool = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: myBool,
      onChanged: (bool value) { setState(() { myBool = value; }); },
    );
  }
}
