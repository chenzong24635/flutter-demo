import 'package:flutter/material.dart';

//
/*
作用：
使用Listener来监听原始触摸事件

继承：

构造函数：（类型 属性 = 默认值）
Listener({
  Key key,
  this.onPointerDown, //手指按下回调
  this.onPointerMove, //手指移动回调
  this.onPointerUp,//手指抬起回调
  this.onPointerCancel,//触摸事件取消回调
  this.behavior = HitTestBehavior.deferToChild, //在命中测试期间如何表现
  Widget child
})
*/

class ListenerPage extends StatelessWidget {
  const ListenerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listener")),
      body: Column(children: <Widget>[
        Stack(
          children: <Widget>[
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.blue)),
              ),
              onPointerDown: (event) => print("down0"),
            ),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                child: Center(child: Text("左上角200*100范围内非文本区域点击")),
              ),
              onPointerDown: (event) => print("down1"),
              // behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
            )
          ],
        ),
        //使用IgnorePointer和AbsorbPointer 组件阻止子widget接收指针事件，
        //这就意味着AbsorbPointer本身是可以接收指针事件的(但其子树不行)，而IgnorePointer不可以
        Listener(
          child: AbsorbPointer( 
            child: Listener(
              child: Container(
                color: Colors.red,
                width: 200.0,
                height: 100.0,
              ),
              onPointerDown: (event)=>print("in"), //此处不会响应
            ),
          ),
          onPointerDown: (event)=>print("up"),
        ),
      ],)
    );
  }
}