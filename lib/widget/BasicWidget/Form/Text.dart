
//[Text](https://api.flutter.dev/flutter/widgets/Text-class.html)


/*
用法：文本

继承： Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > Text

构造函数：（类型 属性 = 默认值）
const Text(
  String data, // 文本内容，不能为 null
  {  
    Key key,
    TextStyle style //样式
    StrutStyle strutStyle, // 使用的支撑杆样式。 支撑杆样式定义支撑杆，该支撑杆设置最小的垂直布局指标
    TextAlign textAlign = TextAlign.left, // 文本对齐方式
    TextDirection textDirection = TextDirection.ltr, // 文本方向
    Locale locale, // 当可以根据区域设置以不同的方式呈现相同的Unicode字符时，用于选择字体
    bool softWrap = true, // 是否自动换行
    TextOverflow overflow = TextOverflow.visible, // 文字溢出后处理 clip（剪裁）、fade（渐隐）、ellipsis（省略）
    int textScaleFactor = 1.0, // 字体显示倍率,相对于父元素字体的大小的倍数，默认值为1.0;可以通过MediaQueryData.textScaleFactor获得
    int maxLines, //最大行数限制
    String semanticsLabel, // 语义标签
    TextWidthBasis textWidthBasis, // 定义如何测量渲染文本的宽度。
  }
)

TextStyle属性：
const TextStyle({
  this.inherit = true,
  this.color,
  this.backgroundColor,
  this.fontSize,
  this.fontWeight,
  this.fontStyle,
  this.letterSpacing,
  this.wordSpacing,
  this.textBaseline,
  this.height, //行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height。
  this.locale,
  this.foreground,
  this.background,
  this.shadows,
  this.fontFeatures,
  this.decoration, //下划线样式
  this.decorationColor,
  this.decorationStyle,
  this.decorationThickness,
  this.debugLabel,
  String fontFamily,
  List<String> fontFamilyFallback,
  String package,
}) 
*/

/*
const TextSpan({
  this.text,
  this.children,
  TextStyle style,
  this.recognizer,
  this.semanticsLabel,
})
*/
import "package:flutter/material.dart";

import './DefaultTextStyle.dart';
import './RichText.dart';
import './../Form/SelectableText.dart';
import 'package:flutter/gestures.dart';

class TextPage extends StatefulWidget {
  TextPage({Key key}) : super(key: key);

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
     //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Text"),),
      body: ListView(
        children: <Widget>[
          Text('Text 用法:',style: TextStyle(color: Colors.black,fontSize: 24.0),),
          Text(
            "I am a Text"*6,  //字符串重复六次
            semanticsLabel: 'fss',
            // softWrap: true,
            // textAlign: TextAlign.right,
            // textDirection: TextDirection.rtl
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textScaleFactor: 2.0,
            // strutStyle: StrutStyle(forceStrutHeight: true, height: 2.0),
            style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 16.0,
              height: 2.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              background: new Paint()..color=Colors.blueAccent,
              //下划线样式
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.wavy,
            )
          ),
          h15,
          Divider(),
          Text('TextSpan用法:',style: TextStyle(color: Colors.black,fontSize: 24.0),),
          Text('通过Text.rich,RichText 将TextSpan 添加到Text中:',style: TextStyle(color: Colors.black,fontSize: 17.0),),
          Text.rich(
            TextSpan(
              style: TextStyle(fontSize: 18.0),
              children: [
                TextSpan(
                  text: "Text: ",
                  semanticsLabel:'',
                  style: TextStyle(
                    color: Colors.blueGrey
                  ), 
                ),
                TextSpan(
                  text: "点我变色",
                  style: TextStyle(
                    color: _toggle ? Colors.blue : Colors.red
                  ),  
                  recognizer: _tapGestureRecognizer
                  ..onTap = () {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  },
                  // recognizer: , //点击链接后的一个处理器
                ),
              ],
            ),
          ),
          h15,
          Divider(),
          RichTextPage(),
          h15,
          Divider(),
          DefaultTextStylePage(),
          h15,
          Divider(),
          Text(
            '通过text的textDirection 设置文本方向',
            textDirection: TextDirection.rtl, 
          ),
          Directionality(
            textDirection: TextDirection.rtl, // 设置文本方向
            child:Text('通过Directionality 设置文本方向'),
          ),
          h15,
          Text('SelectableText--可选的文本',style: TextStyle(color: Colors.black,fontSize: 17.0),),
          SelectableTextPage(),
          h15,
          //大小写转换
          Text(
            'aaa'.toUpperCase()
          ),
          Text(
            'AAA'.toLowerCase()
          ),
        ],
      )
    );
  }
}

Widget h15 = SizedBox(height: 15.0,);