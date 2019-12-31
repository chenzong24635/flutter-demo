import "package:flutter/material.dart";

class AlignPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Align'),),
      body: Column(
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
                    alignment: Alignment(0.0,-0.0),
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
        ],
      ),
      
    );
  }
}