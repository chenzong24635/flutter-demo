import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//https://api.flutter.dev/flutter/cupertino/CupertinoSlider-class.html
//IOS风格 slider
class CupertinoSliderPage extends StatefulWidget {

  @override
  _CupertinoSliderPageState createState() => _CupertinoSliderPageState();
}

class _CupertinoSliderPageState extends State<CupertinoSliderPage> {
  var _progress = 10.0;
  @override
  Widget build(BuildContext context) {
    return CupertinoSlider(
      value: _progress,
      min: 0.0,
      max: 100.0,
      onChanged: (value){
        setState(() {
          _progress = value.roundToDouble();
        });
      },
    );
  }
}