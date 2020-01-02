import "package:flutter/material.dart";
import "package:flutter1/widget/DecoratorWidget/BoxDecoration.dart";

class DecoratedBoxPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DecoratedBox -- 装饰容器'),),
      body: Column(
        children: <Widget>[
          Wrap(
            children: <Widget>[
              DecoratedBox(
                position: DecorationPosition.background, //决定在哪里绘制Decoratio
                decoration: BoxDecoration(
                  // color: Color(0xfffaad0), //颜色
                  // border: BoxBorder.lerp(a, b, t), //边框
                  borderRadius: BorderRadius.circular(3.0), //圆角
                  // image: DecorationImage(), //图片
                  shape: BoxShape.rectangle, //形状
                  gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                  boxShadow: [ //阴影,可以指定多个
                    BoxShadow(
                        color:Colors.black54,
                        offset: Offset(2.0,2.0),
                        blurRadius: 4.0
                    )
                  ],
                ),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                  child: Text("Login", style: TextStyle(color: Colors.white),),
                )
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(10.0),),
          RaisedButton(
            child: Text('BoxDecoration,ShapeDecoration用法'),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => BoxDecorationPage()),);
            },
          )
        ],
      ),
      
    );
  }
}