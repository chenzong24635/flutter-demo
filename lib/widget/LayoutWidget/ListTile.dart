import 'package:flutter/material.dart';

//[ListTile](https://api.flutter.dev/flutter/material/ListTile-class.html)
/*
作用：一个固定高度的行，通常包含一些文本，以及一个行前或行尾图标。

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > ListTile

构造函数：（类型 属性 = 默认值）
  const ListTile({
    Key key,
    this.title, //标题
    this.subtitle,//子标题
    this.leading, //左侧图标
    this.trailing,//右侧图标
    this.contentPadding,
    this.isThreeLine = false, //图标是否在显示三行文本
    this.dense = false, // 图标是否是垂直密集列表的一部分
    this.enabled = true, // 图标是否互动
    this.selected = false, //是否设置文本的颜色为图标的颜色
    this.onTap,
    this.onLongPress,
  })
*/

class ListTilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListTile'),),
      body: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'AAA',style: TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: Text('aaa'),
              leading: Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
              trailing: Icon(Icons.beach_access),
              selected: true,
              dense: true,
            ),
            ListTile(
              title: Text(
                'BBB',style: TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: Text('bbb \nbbb'),
              leading: Icon(
                Icons.school,
                color: Colors.lightBlue,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'CCC',style: TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: Text('ccc \nccc'),
              leading: Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}