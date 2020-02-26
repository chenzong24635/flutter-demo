//[FilterChip](https://api.flutter.dev/flutter/material/FilterChip-class.html)
/*
作用：多选

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > FilterChip

构造函数：（类型 属性 = 默认值）
const FilterChip({
    Key key,
    this.avatar,
    @required this.label,
    this.labelStyle,
    this.labelPadding,
    this.selected = false,
    @required this.onSelected,
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

import 'package:flutter/material.dart';

class FilterChipPage extends StatefulWidget {
  @override
  _FilterChipPageState createState() => _FilterChipPageState();
}

class ActorFilterEntry {
  const ActorFilterEntry(this.name, this.initials);
  final String name;
  final String initials;
}

class _FilterChipPageState extends State<FilterChipPage> {
  final List<ActorFilterEntry> _cast = <ActorFilterEntry>[
    const ActorFilterEntry('Aaron Burr', 'AB'),
    const ActorFilterEntry('Alexander Hamilton', 'AH'),
    const ActorFilterEntry('Eliza Hamilton', 'EH'),
    const ActorFilterEntry('James Madison', 'JM'),
  ];
  List<String> _filters = <String>[];

  Iterable<Widget> get actorWidgets sync* {
    for (ActorFilterEntry actor in _cast) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          avatar: CircleAvatar(child: Text(actor.initials)),
          label: Text(actor.name),
          selected: _filters.contains(actor.name),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(actor.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == actor.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(
          children: actorWidgets.toList(),
        ),
        Text('FilterChip选中: ${_filters.join(', ')}'),
      ],
    );
  }
}