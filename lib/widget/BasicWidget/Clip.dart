import 'package:flutter/material.dart';

//[]()
/*
作用：

继承：

构造函数：（类型 属性 = 默认值）

*/

class ClipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 头像  
    Widget avatar = Image.asset("images/a.jpg", width: 100.0);
    return Scaffold(
      appBar: AppBar(title:Text('Clip')),
      body:ListView(
        children: <Widget>[Column(
          children: <Widget>[
            Text('不剪裁：'),
            avatar,
            Divider(),
            Text('ClipOval-裁剪为圆形'),
            ClipOval(child: avatar),
            Divider(),
            Text('ClipPath -路径裁剪'),
            ClipPath(child: avatar,clipper: TriangleCliper(),),
            Divider(),
            Text('ClipRect-将溢出部分剪裁'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .8,//宽度设为原来宽度一半
                    child: avatar,
                  ),
                ),
                Text("你好世界")
              ],
            ),
            Divider(),
            Text('ClipRRect-剪裁为圆角矩形'),
            ClipRRect(
              borderRadius: BorderRadius.circular(35.0),
              child: avatar,
            ), 
            Divider(),
            Text('其他圆角'),
            SizedBox(height: 30.0,),
            Text('CircleAvatar-头像'),
            CircleAvatar(
              radius: 36.0,
              backgroundImage: AssetImage("images/a.jpg"),
            ),
            new Text("BoxDecoration 圆角"),
            new Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/a.jpg"),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(35.0))),
            ),
            new SizedBox(
              height: 10,
            ),
            SizedBox(height: 40.0,) 
          ],
        )],
      ),
    );
  }
}

class TriangleCliper extends CustomClipper<Path> {
  //获取裁剪范围
  @override
  Path getClip(Size size) {
    //左上角为(0,0)
    var path = Path();
    path.moveTo(50.0, 50.0);//起始点
    path.lineTo(50.0, 0);//(50.0,50.0)->(50.0, 0)
    path.lineTo(100.0, 100.0);//(50.0,0)->(100.0, 100.0)
    path.close();//
    return path;
  }

  //是否重新裁剪
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}