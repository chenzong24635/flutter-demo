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
    //使用Material Design字体图标
    String icons = "";
    icons += "\uE914";
    icons += " \uE000";
    icons += " \uE90D";

    return Scaffold(
      appBar: AppBar(title: Text('Icon')),
      body: ListView(
        children: <Widget>[
          Icon(
            Icons.account_box, 
            color: Colors.black, 
            size: 66,
          ),
          Icon( // 自定义的Icon
            IconData( //字体图标
              0xe567,
              fontFamily: 'MaterialIcons',
              matchTextDirection: true,
            ),
            color: Colors.red
          ),
          IconTheme( //为图标提供属性，必须是Icon的父级
            data: IconThemeData(
              color: Colors.blue,
              opacity: .7,
            ),
            child: Icon(Icons.favorite)
          ),
          Text(icons,
            style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 24.0,
                color: Colors.green
            ),
          ),
          ImageIcon( //图片一定要png，加载出来是纯色的背景图片，颜色通过color定义
            AssetImage('images/FittedBox.png'),
            color: Colors.amber
          ),
        ],
      )
    );
  }
}