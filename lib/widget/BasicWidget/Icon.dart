import 'package:flutter/material.dart';

// [Icon](https://api.flutter.dev/flutter/widgets/Icon-class.html)
// [Material Design所有图标](https://material.io/resources/icons/?style=baseline)
/*
作用： 图标
  体积小：可以减小安装包大小。
  矢量的：iconfont都是矢量图标，放大不会影响其清晰度。
  可以应用文本样式：可以像文本一样改变字体图标的颜色、大小对齐等。
  可以通过TextSpan和文本混用。

使用：
Flutter默认包含了一套Material Design的字体图标，在pubspec.yaml文件中的配置如下
  flutter:
    uses-material-design: true

继承： Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > Icon

构造函数：（类型 属性 = 默认值）
const Icon(
  IconData icon{ //图标
  Key key,
  String semanticLabel // 图标的语义标签
  Color color // 颜色
  double size // icon大小
  TextDirection textDirection //方向
})
*/

class IconPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Icon')),
      body: GridView.count(
        crossAxisCount: 4,
        children: <Widget>[
          Icon(Icons.account_box, color: Colors.black, size: 16,textDirection:TextDirection.rtl),
          Icon(Icons.add_a_photo, color: Colors.red, size: 18,semanticLabel: '23'),
          Icon(Icons.add_circle, color: Colors.black, size: 22),
          Icon(Icons.android, color: Colors.orange, size: 24),
          Icon(Icons.cast_connected, color: Colors.black, size: 26),
          Icon(Icons.verified_user, color: Colors.green, size: 28),
          Icon(Icons.dashboard, color: Colors.black, size: 30),
          Icon(Icons.account_box, color: Colors.black, size: 16),
          Icon(Icons.add_a_photo, color: Colors.red, size: 18),
          Icon(Icons.add_circle, color: Colors.black, size: 22),
          Icon(Icons.android, color: Colors.orange, size: 24),
          Icon(Icons.cast_connected, color: Colors.black, size: 26),
          Icon(Icons.verified_user, color: Colors.green, size: 28),
          Icon(Icons.dashboard, color: Colors.black, size: 30),
          Icon(Icons.account_box, color: Colors.black, size: 16),
          Icon(Icons.add_a_photo, color: Colors.red, size: 18),
          Icon(Icons.add_circle, color: Colors.black, size: 22),
          Icon(Icons.android, color: Colors.orange, size: 24),
          Icon(Icons.cast_connected, color: Colors.black, size: 26),
          Icon(Icons.verified_user, color: Colors.green, size: 28),
          Icon(Icons.dashboard, color: Colors.black, size: 30),
          Icon(Icons.account_box, color: Colors.black, size: 16),
          Icon(Icons.add_a_photo, color: Colors.red, size: 18),
          Icon(Icons.add_circle, color: Colors.black, size: 22),
          Icon(Icons.android, color: Colors.orange, size: 24),
          Icon(Icons.cast_connected, color: Colors.black, size: 26),
          Icon(Icons.verified_user, color: Colors.green, size: 28),
          Icon(Icons.dashboard, color: Colors.black, size: 30),
        ],
      )
    );
  }
}