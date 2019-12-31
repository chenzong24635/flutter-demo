import "package:flutter/material.dart";

class ProgressPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress'),),
      body: ProgressBox()
    );
  }
}

class ProgressBox extends StatefulWidget {
  @override
  _ProgressBoxState createState() => new _ProgressBoxState();
}

class _ProgressBoxState extends State<ProgressBox>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒  
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(20),),
              Text('模糊进度条(会执行一个动画)'),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
              Padding(padding: EdgeInsets.all(20),),
              Text('进度条显示50%'),
              LinearProgressIndicator(
                value: .5, // 当前的进度，取值范围为[0,1]；如果value为null时则指示器会执行一个循环动画（模糊进度）；当value不为null时，指示器为一个具体进度的进度条。
                backgroundColor: Colors.grey[200], // 指示器的背景色
                valueColor: AlwaysStoppedAnimation(Colors.blue), // 进度条背景色
              ),
              Padding(padding: EdgeInsets.all(20),),
              Text('模糊进度条(会执行一个旋转动画)'),
              CircularProgressIndicator(
                strokeWidth: 10.0, // 进度条的粗细
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
              Padding(padding: EdgeInsets.all(20),),
              Text('进度条显示50%，会显示一个半圆'),
              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
              Padding(padding: EdgeInsets.all(20),),
              Text('自定义尺寸',style: TextStyle(fontSize: 16.0),),
              Padding(padding: EdgeInsets.all(5),),
              Text('线性进度条高度指定为10'),
              SizedBox(
                height: 10.0,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .5,
                ),
              ),
              Padding(padding: EdgeInsets.all(5),),
              Text('圆形进度条直径指定为100'),
              SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .7,
                ),
              ),
              Padding(padding: EdgeInsets.all(5),),
              Text('宽高不同，则会显示为椭圆'),
              SizedBox(
                height: 40,
                width: 100,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .7,
                ),
              ),
              Text('进度条颜色动画'),
              Padding(
                padding: EdgeInsets.all(16),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: ColorTween(begin: Colors.red, end: Colors.blue)
                    .animate(_animationController), // 从灰色变成蓝色
                  value: _animationController.value,
                ),
              ),
            ],
          )
        ],
      ),
      
    );
  }
}