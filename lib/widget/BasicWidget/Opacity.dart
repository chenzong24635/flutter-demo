import 'package:flutter/material.dart';

//[参考](https://api.flutter.dev/flutter/widgets/Icon-class.html)
/* 
Opacity(
  double opacity	//透明度。如果想要一个 Widget 消失，那就设置 0.0
  Widget child
)
*/

class OpacityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opacity不透明度'),
      ),
      body: ListView(
        children: <Widget>[
          Opacity(
            opacity: 0.0,
            child: Text('不透明度设置为0'),
          ),
          Opacity(
            opacity: 0.3, //不透明度设置为0.3
            child: Container(
              width: 250.0,
              height: 100.0,
              //添加装饰器
              decoration: BoxDecoration(
                color: Colors.black, //背景色设置为纯黑
              ),
              child: Text(
                '不透明度为0.3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
