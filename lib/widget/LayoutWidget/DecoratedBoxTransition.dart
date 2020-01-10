import "package:flutter/material.dart";
import "../BasicWidget/BoxDecoration.dart";

//https://api.flutter.dev/flutter/widgets/DecoratedBoxTransition-class.html
/*
作用： 边框动画,通过控制器去控制动画边框值的改变，从而控制动画边框

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget AnimatedWidget DecoratedBoxTransition

构造函数：（类型 属性 = 默认值）

*/

class DecoratedBoxTransitionPage extends StatefulWidget {
  DecoratedBoxTransitionPage({Key key}) : super(key: key);

  @override
  _DecoratedBoxTransitionPageState createState() => _DecoratedBoxTransitionPageState();
}

class _DecoratedBoxTransitionPageState extends State<DecoratedBoxTransitionPage> with SingleTickerProviderStateMixin {

  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(
        color: const Color(0xFF000000),
        style: BorderStyle.solid,
        width: 4.0,
      ),
      borderRadius: BorderRadius.zero,
      shape: BoxShape.rectangle,
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66000000),
          blurRadius: 10.0,
          spreadRadius: 4.0,
        )
      ],
    ),
    end: BoxDecoration(
      color: const Color(0xFF000000),
      border: Border.all(
        color: const Color(0xFF202020),
        style: BorderStyle.solid,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(10.0),
      shape: BoxShape.rectangle,
      // No shadow.
    ),
  );

  AnimationController _controller;

  bool _first = true;

  initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DecoratedBoxTransition'),),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DecoratedBoxTransition(
            position: DecorationPosition.background,
            decoration: decorationTween.animate(_controller),
            child: Container(
              child: Container(
                width: 200,
                height: 200,
                padding: EdgeInsets.all(20),
                child: FlutterLogo(),
              ),
            ),
          ),
          SizedBox(height: 20,),
          FlatButton(
            onPressed: () {
              if (_first) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
              _first = !_first;
            },
            child: Text(
              "Click Me!",
            ),
          )
        ],
      ),
    );
  }
}