import 'package:flutter/material.dart';
import 'package:flutter1/widget/LayoutWidget/decoratedBox.dart';

/* 
作用：它是一个Decoration的子类，用于装饰绘制区域。可以设置绘制区域的背景颜色、背景图片、形状、边框等效果。

BoxDecoration({
  Colors color, //背景色
  DecorationImage image,//图片
  BoxBorder border, //边框
  BorderRadiusGeometry borderRadius, //圆角
  List<BoxShadow> boxShadow, //阴影,可以指定多个
  Gradient gradient, //渐变
  BlendMode backgroundBlendMode, //背景混合模式
  BoxShape shape = BoxShape.rectangle, //形状
})


有个DecoratedBox装饰容器组件，主要用BoxDecoration来修饰
*/

//[ShapeDecoration](https://api.flutter.dev/flutter/painting/ShapeDecoration-class.html)
/*
  继承：Object Diagnosticable Decoration ShapeDecoration

  ShapeDecoration(
  Colors color, //背景色
  DecorationImage image,//图片
  List<BoxShadow> shadows, //阴影,可以指定多个
  Gradient gradient, //渐变
  BoxShape shape = BoxShape.rectangle, //形状 @required
)

*/

class BoxDecorationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('BoxDecoration,ShapeDecoration')),
      body: Wrap(
        children:<Widget>[
          Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: ExactAssetImage("lib/images/th.jpg"),
                  fit: BoxFit.cover
              ),
              boxShadow: [ //阴影,可以指定多个
                BoxShadow(
                    color:Colors.black54,
                    offset: Offset(2.0,2.0),
                    blurRadius: 4.0
                )
              ],
              border: Border.all(color: Colors.lightBlueAccent, width: 8)
            ),
            child: Center(
              child: Text(
                "BoxDecoration",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shadows: [ //阴影,可以指定多个
                BoxShadow(
                    color:Colors.black54,
                    offset: Offset(2.0,2.0),
                    blurRadius: 4.0
                )
              ],
              shape: Border.all(
                color: Colors.red,
                width: 8.0,
              ) + Border.all(
                color: Colors.green,
                width: 8.0,
              ) + Border.all(
                color: Colors.blue,
                width: 5.0,
              ),
            ),
            child: const Text('ShapeDecoration', textAlign: TextAlign.center),
          ),
          Center(
            child: RaisedButton(
              child: Text('DecoratedBox容器 用法'),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => DecoratedBoxPage()),);
              },
            ),
          ),
        ]
      ),
    );
  }
}