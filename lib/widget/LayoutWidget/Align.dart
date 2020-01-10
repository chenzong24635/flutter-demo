import 'dart:math' as math;
import "package:flutter/material.dart";
import "package:flutter1/widget/LayoutWidget/Center.dart";

//[Flutter实战](https://book.flutterchina.club/chapter4/alignment.html)
//[官网](https://api.flutter.dev/flutter/widgets/Align-class.html)
/*
作用：调整一个子元素在父元素中的位置

继承：
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > Align

构造函数：（类型 属性 = 默认值）
Algin(
  Key key: //
  widthFactor:, //宽度因子，如果设置的话，Align的宽度就是child的宽度乘以这个值，不能为负数。
  heightFactor:,//高度因子，如果设置的话，Align的高度就是child的高度乘以这个值，不能为负数。
  AlignmentGeometry aligment, //对齐方式;AlignmentGeometry 是一个抽象类，它有两个常用的子类：Alignment和 FractionalOffset
  Widget child,
)

alignment属性的用法:
  Alignment.center, 
  Alignment(0.0,0.0), // 在水平和垂直方向的偏移，坐标原点为矩形的中心
    Alignment(-1.0, -1.0), //代表左侧顶点，
    Alignment(-1.0, 1.0), //代表左侧底部
    Alignment(1.0, -1.0), //代表右侧顶点，
    Alignment(1.0, 1.0), //代表右侧底部，
  FractionalOffset(0.2, 0.6), //同Alignment，但坐标原点为矩形的左侧顶点
*/

class AlignPage extends StatefulWidget {
  AlignPage({Key key}) : super(key: key);

  @override
  _AlignPageState createState() => _AlignPageState();
}

class _AlignPageState extends State<AlignPage> {
  getAlign(x) {
    return Align(
      child: new Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      alignment: Alignment(math.cos(x * math.pi), math.sin(x * math.pi)),
    );
  }
  
  int size = 20;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Align'),),
      body: ListView(
        children: <Widget>[
          Align(
            // key: //
            //widthFactor:, //宽度因子，如果设置的话，Align的宽度就是child的宽度乘以这个值，不能为负数。
            //heightFactor:,//高度因子，如果设置的话，Align的高度就是child的高度乘以这个值，不能为负数。
            // alignment: Alignment.center, //对齐方式
            // alignment: Alignment(0.0,0.0), // 在水平和垂直方向的偏移，坐标原点为矩形的中心
                        //Alignment(-1.0, -1.0), //代表左侧顶点，
                        //Alignment(-1.0, 1.0), //代表左侧底部
                        //Alignment(1.0, -1.0), //代表右侧顶点，
                        //Alignment(1.0, 1.0), //代表右侧底部，
            //alignment: FractionalOffset(0.2, 0.6), //同Alignment，但坐标原点为矩形的左侧顶点
            child: SizedBox(
                width: 300,
                height: 300,
                child: Container(
                  color: Colors.amber,
                  child: Align(
                    // alignment: AlignmentGeometry.,
                    child:Text('Align')
                  ),
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FlutterLogo(
              size: 45,
            ),
          ),
          Text('widthFactor或heightFactor为null时组件的宽高将会占用尽可能多的空间'),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Align(
              child: Text("xxx"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Align(
              widthFactor: 1,
              heightFactor: 1,
              child: Text("xxx"),
            ),
          ),
          Container(
            alignment: Alignment(0, 0),
            child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: List.generate(size, (index) {
                  return getAlign(index.toDouble() / size / 2);
                }),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          RaisedButton(
            child: Text('Center 布局'),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CenterPage()));
            },
          ),
        ],
      ),
      
    );
  }
}