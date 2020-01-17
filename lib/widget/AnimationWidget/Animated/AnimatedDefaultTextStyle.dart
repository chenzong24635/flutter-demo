import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/AnimatedDefaultTextStyle-class.html
/*
作用：文本样式的动画

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget ImplicitlyAnimatedWidget AnimatedDefaultTextStyle

构造函数：（类型 属性 = 默认值）
  const AnimatedDefaultTextStyle({
    Key key,
    @required this.child,
    @required this.style, 子控件的样式，用于动画变化
    this.textAlign,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.maxLines,
    Curve curve = Curves.linear,
    @required Duration duration,
    VoidCallback onEnd,
  })
*/

class AnimatedDefaultTextStylePage extends StatefulWidget {
  AnimatedDefaultTextStylePage({Key key}) : super(key: key);

  @override
  _AnimatedDefaultTextStylePageState createState() => _AnimatedDefaultTextStylePageState();
}

class _AnimatedDefaultTextStylePageState extends State<AnimatedDefaultTextStylePage> {
  bool _change = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedDefaultTextStyle'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: AnimatedDefaultTextStyle (
              //变化样式必须对应，若其中有个未写则不会有动画效果
              //去除 fontSize: 15.0,试试
              style: _change ? 
                TextStyle(fontSize: 70.0,color: Colors.blue) : 
                TextStyle(fontSize: 15.0,color: Colors.deepPurple),
              duration: Duration(seconds: 3),
              curve: Curves.fastOutSlowIn,
              child: Text('AaBbCc'),
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