import "package:flutter/material.dart";

//[](https://api.flutter.dev/flutter/material/ExpansionPanel-class.html)
//[](https://api.flutter.dev/flutter/material/ExpansionPanelList-class.html)
/*
作用：展开面板列表,可以设置展开，收起,必须放在可滑动组件中使用
ExpansionPanel只能在ExpansionPanelList中使用


继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget ExpansionPanelList

构造函数：（类型 属性 = 默认值）
  const ExpansionPanelList({
    Key key,
    this.children = const <ExpansionPanel>[],
    this.expansionCallback,
    this.animationDuration = kThemeAnimationDuration,
  })

  ExpansionPanel({
    @required this.headerBuilder,
    @required this.body,
    this.isExpanded = false,
    this.canTapOnHeader = false,
  }) 
*/

class ExpansionPanelListPage extends StatelessWidget {
  static const String _title = 'ExpansionPanel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: MyStatefulWidget(),
    );
  }
}

class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      // 判断用户点击是否打开
      expansionCallback: (int index, bool isExpanded) {
        // 循环判断用户点击和索引是否一致，并操作状态
        setState(() {
          
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel( 
          // 上下文 是否是打开的
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            subtitle: Text('To delete this panel, tap the trash can icon'),
            trailing: Icon(Icons.delete),
            onTap: () {
              setState(() {
                _data.removeWhere((currentItem) => item == currentItem);
              });
            }
          ),
          isExpanded: item.isExpanded,// 判断是否打开
        );
      }).toList(),
    );
  }
}