import 'package:flutter/material.dart';

//[FlutterLogo](https://api.flutter.dev/flutter/material/FlutterLogo-class.html)
/*
作用：一个logo

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > FlutterLogo

构造函数：（类型 属性 = 默认值）
const FlutterLogo({
  Key key,
  this.size, //图标大小
  this.colors, // 颜色
  this.textColor = const Color(0xFF616161), // 用于在徽标上绘制“Flutter”文本的颜色，配合style
  this.style = FlutterLogoStyle.markOnly, //是否以及在何处绘制“ Flutter”文本。 默认情况下，仅绘制徽标本身
  this.duration = const Duration(milliseconds: 750), //动画的时间长度（当style，colors，textColors改变时）
  this.curve = Curves.fastOutSlowIn, //动画的曲线（当style，colors，textColors改变时）
}) 
*/


class FlutterLogoPage extends StatefulWidget {
  FlutterLogoPage({Key key}) : super(key: key);

  @override
  _FlutterLogoPageState createState() => _FlutterLogoPageState();
}

class _FlutterLogoPageState extends State<FlutterLogoPage> {
  Color myColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FlutterLogo'),),
      body: Container(
        child: Column(children: <Widget>[
          FlutterLogo(
            colors: myColor,//设置颜色
            size: 200,//设置大小
            textColor: Colors.blue,
            duration: Duration(microseconds: 5),
            style: FlutterLogoStyle.horizontal,
            curve: Curves.bounceIn,
          ),
          RaisedButton(
            child:  Text('改变'),
            onPressed: (){
              setState(() {
                myColor = Colors.greenAccent;
              });
            },
          ),
          FlutterLogo(
            size:130.0,
            colors: Colors.green,
          ),
        ],),
      ),
    );
  }
}