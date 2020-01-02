import "package:flutter/material.dart";

class FittedBoxPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FittedBox'),),
      body: ListView(
        children: <Widget>[
          Column(children: <Widget>[
            Text(
              '缩放（Scale）以及位置调整（Position）,使得child适合其尺寸：',
              style: TextStyle(fontSize: 22.0),
            ),
            Text('1.如果外部有约束的话，按照外部约束调整自身尺寸，然后缩放调整child，按照指定的条件进行布局；'),
            Text('2.如果没有外部约束条件，则跟child尺寸一致，指定的缩放以及位置属性将不起作用。'),
            Image.asset('lib/images/FittedBox.png'),
            Container(
              color: Colors.amberAccent,
              width: 300.0,
              height: 300.0,
              child: new FittedBox(
                fit: BoxFit.cover, // 缩放的方式
                alignment: Alignment.topLeft, // 对齐方式
                child: new Container(
                  color: Colors.red,
                  child: new Text("FittedBox"),
                ),
              ),
            ),
          ],)
        ],
      ),
      
    );
  }
}