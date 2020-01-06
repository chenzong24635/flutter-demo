import 'package:flutter/material.dart';

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

class ChipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 头像  
    Widget avatar = Image.asset("images/a.jpg", width: 200.0);
    return Scaffold(
      appBar: AppBar(title:Text('Chip')),
      body:ListView(
        children: <Widget>[Column(
          children: <Widget>[
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),
              label: Text('Aaron Burr'),
            ),
          ],
        )],
      ),
    );
  }
}