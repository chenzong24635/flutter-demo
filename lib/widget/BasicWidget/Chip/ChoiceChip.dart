import 'package:flutter/material.dart';

//[ChoiceChip](https://api.flutter.dev/flutter/material/ChoiceChip-class.html)
/*
作用：单选

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > ChoiceChip

构造函数：（类型 属性 = 默认值）
  const ChoiceChip({
    Key key,
    this.avatar,
    @required this.label,
    this.labelStyle,
    this.labelPadding,
    this.onSelected,
    this.pressElevation,
    @required this.selected,
    this.selectedColor,
    this.disabledColor,
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
    this.avatarBorder = const CircleBorder(),
  })
*/

class ChoiceChipPage extends StatefulWidget {
  @override
  _ChoiceChipPageState createState() => _ChoiceChipPageState();
}

class _ChoiceChipPageState extends State<ChoiceChipPage> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(
        3, 
        (int index) {
          return ChoiceChip(
            label: Text('ChoiceChip $index'),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : null;
              });
            },
          );
        },
      ).toList(),
    );
  }
}