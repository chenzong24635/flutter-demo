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
        ],),
      ),
    );
  }
}