import 'package:flutter/material.dart';


//https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html
/*
作用：Container组件的动画版本，

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget ImplicitlyAnimatedWidget AnimatedContainer

构造函数：（类型 属性 = 默认值）
  AnimatedContainer({
    Key key,
    this.alignment,
    this.padding,
    Color color,
    Decoration decoration,
    this.foregroundDecoration,
    double width,
    double height,
    BoxConstraints constraints,
    this.margin,
    this.transform,
    this.child,
    Curve curve = Curves.linear, //动画曲线
    @required Duration duration, //动画持续时间
    VoidCallback onEnd,
  }) 
*/

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  bool _change = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedContainer'),),
      body: InkWell(
        onTap: () {
          setState(() {
            _change = !_change;
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: _change ? 200.0 : 100.0,
            height: _change ? 100.0 : 200.0,
            color: _change ? Colors.red : Colors.blue,
            transform: _change ? Matrix4.rotationZ(100.0) : Matrix4.rotationZ(0.0),
            alignment: _change ? Alignment.center : AlignmentDirectional.topCenter,
            duration: Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: FlutterLogo(size: 75),
          ),
        ),
      ),
    );
  }
}