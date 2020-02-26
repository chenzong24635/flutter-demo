import 'package:flutter/material.dart';

//[ActionChip](https://api.flutter.dev/flutter/material/ActionChip-class.html)
/*
作用：比普通的chip多一个onPressed事件

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > ActionChip

构造函数：（类型 属性 = 默认值）
  const ActionChip({
    Key key,
    this.avatar,
    @required this.label,
    this.labelStyle,
    this.labelPadding,
    @required this.onPressed,
    this.pressElevation,
    this.tooltip,
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

Widget actionChip = ActionChip(
  onPressed: (){
    print('click');
  },
  avatar: CircleAvatar(
    // backgroundColor: Colors.grey.shade800,
    radius: 36.0,
    backgroundImage: AssetImage("images/a.jpg"),
  ),
  label: Text('ActionChip'),
);