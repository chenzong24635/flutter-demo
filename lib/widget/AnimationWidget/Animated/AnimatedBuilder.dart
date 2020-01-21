import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/AnimatedBuilder-class.html
/*
作用：用于构建动画的通用Widget,将渲染逻辑分离出来

继承：

构造函数：（类型 属性 = 默认值）
  const AnimatedBuilder({
    Key key,
    @required Listenable animation,
    @required this.builder,
    this.child,
  })
*/

class AnimatedBuilderPage extends StatefulWidget {
  AnimatedBuilderPage({Key key}) : super(key: key);

  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _controller;

  initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    //使用弹性曲线
    _animation=CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    //图片宽高从0变到300
    _animation = Tween(begin: 50.0, end: 300.0)
      .animate(_animation)
      ..addListener(() {
        setState((){
          print('1');
        });
      })
      ..addStatusListener((status) {//动画状态监听
        if (status == AnimationStatus.completed) {
          //动画执行结束时反向执行动画
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //动画恢复到初始状态时执行动画（正向）
          _controller.forward();
        }
      });

    //启动动画
    _controller.forward();
  }
  
  dispose() {
    //路由销毁时需要释放动画资源
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilder'),
      ),
      body: Column(children: <Widget>[
        GrowTransition(
          child: Image.asset("images/a.jpg"),
          animation: _animation,
        ),
      ],)
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Container(
            height: animation.value, 
            width: animation.value, 
            child: child
          );
        },
        child: child
      ),
    );
  }
}
