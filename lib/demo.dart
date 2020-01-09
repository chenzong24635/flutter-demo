import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  DemoPage({Key key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
   String selectValue;
  List _list = ["分享", "选择", "收藏"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义组件"),
      ),
      body:               RaisedButton(
                child: new Text('选择日期'),
                onPressed: () {
                  // 调用函数打开
                  showDatePicker(
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime.now().subtract(new Duration(days: 30)), // 减 30 天
                      lastDate: new DateTime.now().add(new Duration(days: 30)),       // 加 30 天
                  ).then((DateTime val) {
                      print(val);   // 2018-07-12 00:00:00.000
                  }).catchError((err) {
                      print(err);
                  });
                },
              ),
    );
  }
  _onChanged(String value) {
    //更新对象的状态
    setState(() {
      selectValue = value;
    });
  }
}

class DateM extends StatefulWidget {
  DateM({Key key}) : super(key: key);

  @override
  _DateMState createState() => _DateMState();
}

class _DateMState extends State<DateM> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('sd'),);
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
