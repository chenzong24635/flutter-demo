import 'package:flutter/material.dart';

//[Card](https://api.flutter.dev/flutter/material/Card-class.html)
/*
作用：一张卡片样式

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > Card

构造函数：（类型 属性 = 默认值）
const Card({
  Key key,
  this.color,
  this.elevation,
  this.shape,
  this.borderOnForeground = true,
  this.margin,
  this.clipBehavior,
  this.child,
  this.semanticContainer = true,
}) 
*/

class CardPage extends StatefulWidget {
  CardPage({Key key}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card')),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(children: <Widget>[
          Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                width: 300,
                height: 100,
                child: Text('A card that can be tapped'),
              ),
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('The Enchanted Nightingale'),
                  subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () { /* ... */ },
                    ),
                    FlatButton(
                      child: const Text('LISTEN'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ],
            ),
          ),
          renderImageNormal("images/th.jpg"),
          renderImageRatio(context, "images/a.jpg"),
        ],),
      ),
    );
  }

  renderImageNormal(image) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                bottomLeft: Radius.circular(4.0),
              ),
              child: new Image.asset(
                image,
                fit: BoxFit.cover,
                width: 70,
                height: 70,
              ),
            ),
            new SizedBox(
              width: 10,
            ),
            new Expanded(
                child: new Text(
              'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'
              'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'
              'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15),
            )),
          ],
        ),
      ),
    );
  }

  renderImageRatio(context, image) {
    ///大概是屏幕 6 分之一的宽度
    double itemHeight = MediaQuery.of(context).size.width / 6;

    /// iphone xs max 的比例是 2688 * 1242; 拿到的 size 是 896.0 * 414.0
    double textSize = 15.0 * MediaQuery.of(context).size.width / 414.0;

    /// 注意，这是在 data.textScaleFactor = 1 的情况下
    var data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);

    return Card(
      margin: EdgeInsets.all(5),
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                bottomLeft: Radius.circular(4.0),
              ),
              child: new Image.asset(
                image,
                fit: BoxFit.cover,
                height: itemHeight,
                width: itemHeight,
              ),
            ),
            new SizedBox(
              width: 10,
            ),
            new Expanded(
                child: new Text(
              'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'
              'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'
              'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: textSize),
            )),
          ],
        ),
      ),
    );
  }

}