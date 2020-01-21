import 'package:flutter/material.dart';


class AnimatedPaddingPage extends StatefulWidget {
  AnimatedPaddingPage({Key key}) : super(key: key);

  @override
  _AnimatedPaddingPageState createState() => _AnimatedPaddingPageState();
}

class _AnimatedPaddingPageState extends State<AnimatedPaddingPage> {
  double _padding = 0.0;

  void _change() {
    setState(() => _padding = 50.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedPadding'),),
      body: Column(children: <Widget>[
        Container(
          height: 200.0,
          color: Colors.amber,
          child: AnimatedPadding(
            padding: EdgeInsets.all(_padding),
            duration: Duration(seconds: 3),
            child: FlutterLogo(size:50.0),
            onEnd: (){
            },
          ),
        ),
        RaisedButton(
          child: Text('padding'),
          onPressed: (){
            _change();
          },
        )
      ],),
    );
  }
}