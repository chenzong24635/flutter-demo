import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/material/CircleAvatar-class.html
/*
作用：圆形头像

继承：

构造函数：（类型 属性 = 默认值）

const CircleAvatar({
  Key key,
  this.child,
  this.backgroundColor,
  this.backgroundImage,
  this.foregroundColor,
  this.radius,
  this.minRadius,
  this.maxRadius,
})
*/

class CircleAvatarPage extends StatelessWidget {
  const CircleAvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(children: <Widget>[
      CircleAvatar(
        backgroundImage: AssetImage('images/a.jpg'),
        // minRadius: 40.0,
      ),
      CircleAvatar(
        backgroundImage: AssetImage('images/a.jpg'),
        minRadius: 30.0,
      ),
      CircleAvatar(
        child: Image.asset('images/a.jpg'),
        maxRadius: 60.0,
      ),
    ],);
  }
}