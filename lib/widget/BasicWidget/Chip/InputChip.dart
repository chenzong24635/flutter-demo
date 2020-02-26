import 'package:flutter/material.dart';

//[InputChip](https://api.flutter.dev/flutter/material/InputChip-class.html)
/*
作用：

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > InputChip

构造函数：（类型 属性 = 默认值）
  const InputChip({
    Key key,
    this.avatar,
    @required this.label,
    this.labelStyle,
    this.labelPadding,
    this.selected = false,
    this.isEnabled = true,
    this.onSelected,
    this.deleteIcon,
    this.onDeleted,
    this.deleteIconColor,
    this.deleteButtonTooltipMessage,
    this.onPressed,
    this.pressElevation,
    this.disabledColor,
    this.selectedColor,
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
    this.selectedShadowColor,
    this.showCheckmark,
    this.checkmarkColor,
    this.avatarBorder = const CircleBorder(),
  })
*/

class InputChipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 头像  
    return  InputChip(
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: Text('InputChip'),
      ),
      label: Text('InputChip'),
      onPressed: () {
        print('I am InputChip');
      }
    );
  }
}