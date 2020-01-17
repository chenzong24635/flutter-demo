import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/AnimatedBuilder-class.html
/*
作用：用于构建动画的通用Widget,将渲染逻辑分离出来
创建一个AnimationController时，需要传递一个vsync参数，存在vsync时会防止屏幕外动画消耗不必要的资源。 

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
  Animation<double> animation;
  AnimationController controller;
  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);

    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);

    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AnimatedBuilder'),
        ),
        body: GrowTransition(
          child: Image.asset("images/a.jpg"),
          animation: animation,
        ));
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
            return Container(height: animation.value, width: animation.value, child: child);
          },
          child: child),
    );
  }
}
