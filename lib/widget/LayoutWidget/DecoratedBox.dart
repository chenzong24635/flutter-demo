import "package:flutter/material.dart";
import "../BasicWidget/BoxDecoration.dart";

//https://api.flutter.dev/flutter/widgets/DecoratedBox-class.html
/*
作用： 描绘边框

继承：Object Diagnosticable DiagnosticableTree Widget RenderObjectWidget SingleChildRenderObjectWidget DecoratedBox

构造函数：（类型 属性 = 默认值）
  const DecoratedBox({
    Key key,
    @required this.decoration,
    this.position = DecorationPosition.background,  //决定在哪里绘制Decoratio
    Widget child,
  })
*/

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
                position: DecorationPosition.background,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]),
                  boxShadow: [
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
          DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              border: Border.all(
                color: const Color(0xFF000000),
                style: BorderStyle.solid,
                width: 4.0,
              ),
              borderRadius: BorderRadius.zero,
              shape: BoxShape.rectangle,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Color(0x66000000),
                  blurRadius: 10.0,
                  spreadRadius: 4.0,
                )
              ],
            ),
            child: Container(
              child: Container(
                width: 200,
                height: 200,
                padding: EdgeInsets.all(20),
                child: FlutterLogo(),
              ),
            ),
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