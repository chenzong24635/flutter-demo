import "package:flutter/material.dart";

//[参考](https://docs.flutter.io/flutter/widgets/Offstage-class.html)
/*
作用：来控制child是否显示

继承关系：Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > Offstage

Offstage({ 
  Key key, 
  this.offstage = true, //默认为true，也就是不显示，当为flase的时候，会显示该控件
  Widget child 
})

*/

class OffstagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return OffstageBox();
  }
}

class OffstageBox extends StatefulWidget {
  @override
  _OffstageBoxState createState() => _OffstageBoxState();
}

class _OffstageBoxState extends State<OffstageBox> {
  bool offstage = true;
  String txt = '显示';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Offstage'),),
      body: Container(
        color: Colors.green,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            new Offstage(
              offstage: offstage,
              child: Container(color: Colors.blue, height: 100.0,child:Text('我显示了')),
            ),
            RaisedButton(
              child: Text(txt),
              onPressed: () {
                setState(() {
                  offstage = !offstage;
                  txt = offstage ? '显示' : '隐藏';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}