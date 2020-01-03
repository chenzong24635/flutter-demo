import 'package:flutter/material.dart';


Widget list1 = ListView(
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

Widget list2 = ListView.builder(
  // 必须指定列表项的长度
  itemCount: 4,
  // Item 项的构建器
  itemBuilder: (BuildContext ctx, int i) {
    return Text('aaa');
  }
);

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
    ];

    for (var i = 0,len = data.length; i < len; i++) {
      // print(data[i]["title"]);
      list.add(ListTile(
        title: Text(data[i]["title"],style: TextStyle(fontSize: 18.0)),
        subtitle: Text(data[i]["subtitle"]),
        leading: icons[i],
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
          // Navigator.pushNamed(context, "detailPage", arguments: data[i]);
        },
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
      ),
      // body: list2,
      body: Center(
        child: ListView(
          children: list,
        ),
      ),
    );
  }
}