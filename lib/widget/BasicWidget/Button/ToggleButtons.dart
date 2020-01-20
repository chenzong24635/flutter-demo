//
/*
作用：

继承：

构造函数：（类型 属性 = 默认值）

*/
import 'package:flutter/material.dart';

class ToggleButtonsPage extends StatefulWidget {

  @override
  _ToggleButtonsPageState createState() => _ToggleButtonsPageState();
}

class _ToggleButtonsPageState extends State<ToggleButtonsPage> {
  List<bool> isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.call),
        Icon(Icons.cake),
      ],
      onPressed: (int index) {
        setState(() {
          isSelected = isSelected.map((item){
            return item = false;
          }).toList();
          isSelected[index] = !isSelected[index];
        });
      },
      isSelected: isSelected,
    );
  }
}

