import 'package:flutter/material.dart';

class TransformPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Transform')),
      body: ListView(children: <Widget>[
        Column(children: <Widget>[
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateZ(15 * 3.1415927 / 180)
              ..scale(1.5),
            child: Container(
              child: Text(
                "rotate + scale",
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                color: Colors.blue[400],
              ),
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(46.0),
            ),
          ),
          Container(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(0.0,10.0,0.0,30.0),
            child: new Transform(
              alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
              transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
              child: new Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text('skewY'),
              ),
            ),
          ),
          DecoratedBox(
            decoration:BoxDecoration(color: Colors.blue),
            child: Transform.scale(
                scale: 2.0, //放大到2倍
                child: Text("Transform.scale")
            )
          ),
          Padding(padding: EdgeInsets.all(10),),
          DecoratedBox(
            decoration:BoxDecoration(color: Colors.blue),
            //默认原点为左上角，左移20像素，向上平移5像素  
            child: Transform.translate(
              offset: Offset(-20.0, -5.0),
              child: Text("Transform.translate"),
            ),
          ),
          Padding(padding: EdgeInsets.all(20),),
          Text(
            'Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的',
            style: TextStyle(fontSize: 18.0)
          ),
          Text(
            '如下：',
            style: TextStyle(fontSize: 18.0,color:Colors.red)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration:BoxDecoration(color: Colors.blue),
                child: Transform.scale(
                  scale: 1.5,
                  child: Text("Hello world")
                )
              ),
              Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
            ],
          ),
          Padding(padding: EdgeInsets.all(20),),
          Text(
            "RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小", 
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            '如下：',
            style: TextStyle(fontSize: 18.0,color:Colors.red)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                //将Transform.rotate换成RotatedBox  
                child: RotatedBox( 
                  quarterTurns: 1, //旋转90度(1/4圈)
                  child: Text("Hello world"),
                ),
              ),
              Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
            ],
          ),
        ],)
      ],)
    );
  }
}

