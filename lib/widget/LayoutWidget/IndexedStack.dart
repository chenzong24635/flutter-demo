import "package:flutter/material.dart";

//[参考](https://api.flutter.dev/flutter/widgets/IndexedStack-class.html)
/*
作用：继承自Stack，它的作用是显示第index个child，其他child都是不可见的。所以IndexedStack的尺寸永远是跟最大的子节点尺寸一致。

继承关系：

*/

class IndexedStackPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IndexedStack'),),
      body: Container(
        color: Colors.yellow,
        padding: EdgeInsets.all(20.0),
        child: IndexedStack(
          index: 0, //操作第一个元素
          alignment: Alignment(0.1, 0.6),
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('lib/images/a.jpg'),
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
      ),
    );
  }
}