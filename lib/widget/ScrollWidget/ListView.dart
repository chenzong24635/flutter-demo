//https://api.flutter.dev/flutter/widgets/ListView-class.html
/*
作用：是最常用的可滚动组件之一，线性排列的可滚动列表，并且它也支持基于Sliver的延迟构建模型

继承：

构造函数：（类型 属性 = 默认值）

*/
import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ListViewBox();
  }
}

class ListViewBox extends StatefulWidget{
  @override
  _ListViewBoxState createState() => _ListViewBoxState();
}

class _ListViewBoxState extends State<ListViewBox>{

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      // body: List1(),
      // body: list2,
      // body: list3,
      body: list4,
    );
  }
}

class List1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[];
    List<Icon> icons = <Icon>[
      Icon(Icons.add_a_photo),
      Icon(Icons.add_alarm),
      Icon(Icons.album),
      Icon(Icons.aspect_ratio),
      Icon(Icons.border_all),
      Icon(Icons.call),
      Icon(Icons.print),
      Icon(Icons.question_answer),
      Icon(Icons.replay_10),
      Icon(Icons.zoom_in),
      Icon(Icons.zoom_out),
    ];
    List data = [
      {"id": 1, "title": "AAA", "subtitle": "aaa"},
      {"id": 2, "title": "BBB", "subtitle": "bbb"},
      {"id": 3, "title": "CCC", "subtitle": "ccc"},
      {"id": 4, "title": "DDD", "subtitle": "ddd"},
      {"id": 5, "title": "EEE", "subtitle": "eee"},
      {"id": 6, "title": "FFF", "subtitle": "fff"},
      {"id": 7, "title": "GGG", "subtitle": "ggg"},
      {"id": 8, "title": "HHH", "subtitle": "hhh"},
      {"id": 9, "title": "III", "subtitle": "iii"},
      {"id": 0, "title": "JJJ", "subtitle": "jjj"},
      {"id": 10, "title": "KKK", "subtitle": "KKK"},
    ];

    for (var i = 0,len = data.length; i < len; i++) {
      list.add(ListTile(
        title: Text(data[i]["title"],style: TextStyle(fontSize: 18.0)),
        subtitle: Text(data[i]["subtitle"]),
        leading: icons[i],
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){},
      ));
    }
    return ListView(
      children: list,
    );
  }
}


//ListView构造函数适用于小列表
Widget list2 = ListView(
  children: <Widget>[
    ListTile(
      title: Text('我要发布'),
      trailing: Icon(Icons.send),
    ),
    Divider(),
    ListTile(
      title: Text('注销'),
      trailing: Icon(Icons.exit_to_app),
    )
  ]
);

//为了处理包含大量数据的列表，最好使用ListView.builder构造函数。
//ListView的构造函数需要一次创建所有项目，
//但ListView.builder的构造函数不需要，它将在列表项滚动到屏幕上时创建该列表项。
Widget list3 = ListView.builder(
  padding: EdgeInsets.all(10.0),
  // 必须指定列表项的长度,为null，则为无限列表。
  itemCount: 34,
  // Item 项的构建器
  itemBuilder: (BuildContext ctx, int i) {
    return Text('$i',style: TextStyle(fontSize: 22.0),);
  },
);

//类似ListView.builder，实现Item之间的分割线
Widget list4 = ListView.separated(
  // 必须指定列表项的长度,为null，则为无限列表。
  itemCount: 34,
  // Item 项的构建器
  itemBuilder: (BuildContext ctx, int i) {
    return Text('$i',style: TextStyle(fontSize: 22.0),);
  },
  //分割组件
  separatorBuilder: (BuildContext context, int index) => 
    index%2 == 0 ? Divider(thickness:5,color:Colors.red) : Divider(height:10,color:Colors.blue),
);