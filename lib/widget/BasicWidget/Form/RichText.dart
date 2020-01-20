//[RichText](https://api.flutter.dev/flutter/widgets/RichText-class.html)
/*
作用：富文本

继承：

构造函数：（类型 属性 = 默认值）
  RichText({
    Key key,
    @required this.text,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.textScaleFactor = 1.0,
    this.maxLines,
    this.locale,
    this.strutStyle,
    this.textWidthBasis = TextWidthBasis.parent,
  })
*/

import 'package:flutter/material.dart';

class RichTextPage extends StatelessWidget {
  const RichTextPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: <Widget>[
        Text('RichText 用法:',style: TextStyle(color: Colors.black,fontSize: 24.0),),
        Text('可以显示多种样式(富文本)的widget',style: TextStyle(color: Colors.black,fontSize: 17.0),),
        Text('Text和Text.rich都是RichText构建出来的',style: TextStyle(color: Colors.black,fontSize: 17.0),),
        RichText(
          // textWidthBasis: TextWidthBasis.longestLine,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "RichText ",
                style: TextStyle(
                  color: Colors.red[300],
                )
              ),
              TextSpan(
                text: "TextSpan",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  fontSize: 48.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}