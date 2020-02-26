
//[Chilp](https://api.flutter.dev/flutter/material/Chip-class.html)
/*
作用：

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > Chip

构造函数：（类型 属性 = 默认值）
const Chip({
  Key key,
  this.avatar,
  @required this.label,
  this.labelStyle,
  this.labelPadding,
  this.deleteIcon,
  this.onDeleted,
  this.deleteIconColor,
  this.deleteButtonTooltipMessage,
  this.shape,
  this.clipBehavior = Clip.none,
  this.focusNode,
  this.autofocus = false,
  this.backgroundColor,
  this.padding,
  this.materialTapTargetSize,
  this.elevation,
  this.shadowColor,
})
*/
import 'package:flutter/material.dart';

import 'ActionChip.dart';
import 'InputChip.dart';
import 'ChoiceChip.dart';
import 'FilterChip.dart';

class ChipPage extends StatefulWidget {
  ChipPage({Key key}) : super(key: key);

  @override
  _ChipPageState createState() => _ChipPageState();
}

class _ChipPageState extends State<ChipPage> {

  @override
  Widget build(BuildContext context) {
    // 头像  
    return Scaffold(
      appBar: AppBar(title:Text('Chip')),
      body:ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
              Chip(
                avatar: CircleAvatar(
                  radius: 36.0,
                  backgroundImage: AssetImage("images/th.jpg"),
                ),
                label: Text('Chip'),
              ),
              Chip(
                deleteIcon: Icon(Icons.close),
                deleteIconColor: Colors.red,
                onDeleted: () {
                  print('del');
                },
                deleteButtonTooltipMessage: "删除该条",
                avatar: CircleAvatar(
                  // backgroundColor: Colors.grey.shade800,
                  radius: 36.0,
                  backgroundImage: AssetImage("images/th.jpg"),
                ),
                label: Text('Chip'),
              ),
            ],),
            actionChip,
            InputChipPage(),
            ChoiceChipPage(),
            FilterChipPage(),


          ],
      ),
    );
  }
}