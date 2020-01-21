import 'package:flutter/material.dart';

//
/*
作用：AnimatedWidget类封装了调用setState()的细节，并允许我们将widget分离出来

继承：

构造函数：（类型 属性 = 默认值）

*/

class AnimatedWidgetPage extends StatefulWidget {
  @override
  _AnimatedWidgetPageState createState() => new _AnimatedWidgetPageState();
}

class _AnimatedWidgetPageState extends State<AnimatedWidgetPage>
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
    return AnimatedImage(animation: _animation,);
  }

}


class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    
    final Animation<double> animation = listenable;

    return Scaffold(
      appBar: AppBar(title: Text('AnimatedWidget'),),
      body: Column(children: <Widget>[
        Center(
          child: Image.asset("images/a.jpg",
              width: animation.value,
              height: animation.value
          ),
        ),
      ],),
    );
  }
}