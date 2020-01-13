import "package:flutter/material.dart";

//[参考](https://api.flutter.dev/flutter/widgets/IndexedStack-class.html)
/*
作用：继承自Stack，它的作用是显示第index个child，其他child都是不可见的。所以IndexedStack的尺寸永远是跟最大的子节点尺寸一致。

继承关系：

*/

class IndexedStackPage extends StatefulWidget {
  IndexedStackPage({Key key}) : super(key: key);

  @override
  _IndexedStackPageState createState() => _IndexedStackPageState();
}

class _IndexedStackPageState extends State<IndexedStackPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: box0(),
    );
  }
}

class box0 extends StatefulWidget {
  box0({Key key}) : super(key: key);

  @override
  _box0State createState() => _box0State();
}

class _box0State extends State<box0> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 300,
          child: IndexedStack(
            index: _index,
            children: <Widget>[
              Container(
                color: Colors.pink,
                child: Center(
                  child: Text('Page 1'),
                ),
              ),
              Container(
                color: Colors.cyan,
                child: Center(
                  child: Text('Page 2'),
                ),
              ),
              Container(
                color: Colors.deepPurple,
                child: Center(
                  child: Text('Page 3'),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                if (_index <= 0) return;
                setState(() {
                  _index -= 1;
                });
              },
              child: Text(
                "Prev",
              ),
            ),
            FlatButton(
              onPressed: () {
                if (_index >= 2) return;
                setState(() {
                  _index += 1;
                });
              },
              child: Text(
                "Next",
              ),
            )
          ],
        ),
        box1,
      ],
    );
  }
}


Widget box1 = 
Container(
  color: Colors.yellow,
  padding: EdgeInsets.all(20.0),
  child: IndexedStack(
    index: 0, //操作第一个元素
    alignment: Alignment(0.1, 0.6),
    children: [
      CircleAvatar(
        backgroundImage: AssetImage('images/a.jpg'),
        radius: 100.0,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.black45,
        ),
        child: Text(
          'AAAA',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
  ),
);