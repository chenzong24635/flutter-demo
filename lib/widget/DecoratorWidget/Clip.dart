import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 头像  
    Widget avatar = Image.asset("lib/images/a.jpg", width: 200.0);
    return Scaffold(
      appBar: AppBar(title:Text('Clip')),
      body:ListView(
        children: <Widget>[Column(
          children: <Widget>[
            Text('不剪裁：'),
            avatar,
            Divider(),
            Text('ClipOval-裁剪为圆形'),
            ClipOval(child: avatar),
            Divider(),
            Text('ClipRect-将溢出部分剪裁'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .8,//宽度设为原来宽度一半
                    child: avatar,
                  ),
                ),
                Text("你好世界")
              ],
            ),
            Divider(),
            Text('ClipRRect-剪裁为圆角矩形'),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: avatar,
            ), 
            Divider(),
            Text('CircleAvatar-头像'),
            CircleAvatar(
              radius: 36.0,
              backgroundImage: AssetImage("lib/images/a.jpg"),
            ), 
          ],
        )],
      ),
    );
  }
}