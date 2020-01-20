import 'package:flutter/material.dart';

//[](https://api.flutter.dev/flutter/material/DropdownButton-class.html)
/*
作用：下拉列表

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget DropdownButton

构造函数：（类型 属性 = 默认值）
  DropdownButton({
    Key key,
    @required this.items,
    this.selectedItemBuilder,
    this.value,
    this.hint,
    this.disabledHint,
    @required this.onChanged,
    this.elevation = 8,
    this.style,
    this.underline,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize = 24.0,
    this.isDense = false,
    this.isExpanded = false,
    this.itemHeight = kMinInteractiveDimension,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
  })
*/

class DropdownButtonPage extends StatefulWidget {
  DropdownButtonPage({Key key}) : super(key: key);

  @override
  _DropdownButtonPageState createState() => _DropdownButtonPageState();
}

class _DropdownButtonPageState extends State<DropdownButtonPage> {
  String selectValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        //要显示的条目
        items: _getItems(),
        // items: _getCityList(),
        //默认显示的值
        hint: Text("请选择城市"),
        //下拉菜单选中的值（注意：在初始化时，要么为null，这时显示默认hint的值；
        // 如果自己设定值，则值必须为列表中的一个值，如果不在列表中，会抛出异常）
        value: selectValue,
        onChanged: (itemValue) {//itemValue为选中的值
          print("itemValue=$itemValue");
          _onChanged(itemValue);
        },
    );
  }
  _onChanged(String value) {
    //更新对象的状态
    setState(() {
      selectValue = value;
    });
  }
}



//返回城市列表，写法一
List<DropdownMenuItem> _getItems() {
  List<DropdownMenuItem> items = new List();
  //value 表示DropdownButton.onChanged的返回值
  items.add(DropdownMenuItem(child: Text("北京"), value: "BJ"));
  items.add(DropdownMenuItem(child: Text("上海"), value: "SH"));
  items.add(DropdownMenuItem(child: Text("广州"), value: "GZ"));
  items.add(DropdownMenuItem(child: Text("深圳"), value: "SZ"));
  return items;
}

//返回城市列表，写法二
List<DropdownMenuItem<String>> _getCityList() {
  var list = ["北京", "上海", "广州", "深圳"];
  return list.map((item) => DropdownMenuItem(
    value: item,
    child: Text(item),
  )).toList();
}
