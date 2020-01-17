import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/AnimatedCrossFade-class.html
/*
作用：淡入淡出动画,在两个给定的子wdiget之间 交替淡入淡出

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget AnimatedCrossFade

构造函数：（类型 属性 = 默认值）
  const AnimatedCrossFade({
    Key key,
    @required this.firstChild,
    @required this.secondChild,
    this.firstCurve = Curves.linear, //firstChild的动画曲线
    this.secondCurve = Curves.linear, //secondChild的动画曲线
    this.sizeCurve = Curves.linear, // firstChild,secondChild的尺寸之间的动画曲线。
    this.alignment = Alignment.topCenter,
    @required this.crossFadeState,// 动画完成后将显示的子级
    @required this.duration, // 动画的持续时间
    this.reverseDuration,
    this.layoutBuilder = defaultLayoutBuilder, // 放置firstChild和secondChild小部件的构建器
  }) 
*/

class AnimatedCrossFadePage extends StatefulWidget {
  AnimatedCrossFadePage({Key key}) : super(key: key);

  @override
  _AnimatedCrossFadePageState createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  bool _change = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedCrossFade'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: AnimatedCrossFade(
              duration: Duration(seconds: 3),
              firstChild: FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
              secondChild: FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
              crossFadeState: _change ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _change = !_change;
              });
            },
            child: Text('Change',style:TextStyle(fontSize: 22.0,color: Colors.red))
          ),
        ],
      )
    );
  }
}