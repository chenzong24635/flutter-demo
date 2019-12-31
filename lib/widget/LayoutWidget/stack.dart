import 'package:flutter/material.dart';

class StackPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Stack -- 层叠布局')),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment(0.1, 0.5), // 设置 Stack 中非第一个 Widget 的相对位置
            textDirection: TextDirection.ltr,
            fit: StackFit.loose, // 用于确定没有定位的子组件如何去适应Stack的大小。StackFit.loose表示使用子组件的大小，StackFit.expand表示扩伸到Stack的大小。
            overflow: Overflow.clip, // 显示超出时
            children: [
              // 第一个 Widget
              CircleAvatar(
                backgroundImage: AssetImage('lib/images/th.jpg'),
                radius: 100,
              ),
              // 第二个 Widget
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.black45,
                ),
                child: Text(
                  'CoorChice',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text('1')
                ),
              ),
              Container(
                width: 60,
                height: 60,
                color: Colors.green,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text('2')
                ),
              ),
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
                child: Text('3'),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(20.0),),
          Text("Stack结合Positioned布局:",style: TextStyle(fontSize: 22.0)),
          Padding(padding: EdgeInsets.all(5.0),),
          Stack(
            alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              Positioned(
                left: 18.0,
                child: Text("I am Jack"),
              ),
              Positioned(
                right: 3.0,
                child: Text("Your friend"),
              )        
            ],
          ),
        ],
      )
    );
  }
}

/* class StackPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('通过ConstrainedBox来确保Stack占满屏幕')),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )        
          ],
        ),
      ),
    );
  }
}
 */