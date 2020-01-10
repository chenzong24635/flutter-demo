import "package:flutter/material.dart";
//[Text](https://api.flutter.dev/flutter/widgets/Text-class.html)
//[RichText](https://api.flutter.dev/flutter/widgets/RichText-class.html)
//[DefaultTextStyle](https://api.flutter.dev/flutter/widgets/DefaultTextStyle-class.html)
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
    int textScaleFactor = 1.0, // 字体显示倍率,相对于父元素字体的大小的倍数，默认值为1.0
    int maxLines, //最大行数限制
    String semanticsLabel, // 语义标签
    TextWidthBasis textWidthBasis, // 定义如何测量渲染文本的宽度。
  }
)

TextStyle属性：
TextStyle(
    color: Color(0xffffffff),
    fontSize: 16.0,
    height: 2.0, //行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height。
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    background: new Paint()..color=Colors.blueAccent,
    //下划线样式
    decoration: TextDecoration.lineThrough,
    decorationColor: Colors.red,
    decorationStyle: TextDecorationStyle.wavy,
)
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
  this.height,
  this.locale,
  this.foreground,
  this.background,
  this.shadows,
  this.fontFeatures,
  this.decoration,
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

class TextPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Text RichText TextSpan"),),
      body: ListView(
        children: <Widget>[
          Text('Text 用法:',style: TextStyle(color: Colors.black,fontSize: 24.0),),
          Text(
            "I am a Text"*6,  //字符串重复六次
            semanticsLabel: 'fss',
            // softWrap: true, // 是否自动换行（默认true）
            // textAlign: TextAlign.right, // 文本对齐方式 (默认left)
            // textDirection: TextDirection.rtl, // 文本方向(默认ltr)
            overflow: TextOverflow.ellipsis, // 文字溢出后处理（默认visible）
            maxLines: 2, //最大行数限制
            textScaleFactor: 2, // 字体显示倍率,相对于父元素字体的大小的倍数，默认值为1.0
            // strutStyle: StrutStyle(forceStrutHeight: true, height: 2.0), //设置行高
            style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 16.0,
              height: 2.0, //行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height。
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              background: new Paint()..color=Colors.blueAccent,
              //下划线样式
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.wavy,
            )
          ),
          Padding(padding: EdgeInsets.all(15),),
          Divider(),
          Text('TextSpan用法:',style: TextStyle(color: Colors.black,fontSize: 24.0),),
          Text('通过Text.rich 方法将TextSpan 添加到Text中:',style: TextStyle(color: Colors.black,fontSize: 17.0),),
          Text.rich(
            TextSpan(
              style: TextStyle(fontSize: 18.0),
              children: [
                TextSpan(
                  text: "Home: ",
                  semanticsLabel:'daa',
                  style: TextStyle(
                    color: Colors.red
                  ), 
                ),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(
                    color: Colors.blue
                  ),  
                  // recognizer:, //点击链接后的一个处理器
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(15),),
          Divider(),
          Text('RichText 用法:',style: TextStyle(color: Colors.black,fontSize: 24.0),),
          Text('可以显示多种样式(富文本)的widget',style: TextStyle(color: Colors.black,fontSize: 17.0),),
          RichText(
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
          Padding(padding: EdgeInsets.all(15),),
          Divider(),
          Text('DefaultTextStyle 用法:',style: TextStyle(color: Colors.black,fontSize: 24.0),),
          Text('用于设置默认文本样式',style: TextStyle(color: Colors.black,fontSize: 17.0),),
          DefaultTextStyle(
            //1.设置文本默认样式  
            style: TextStyle(
              color:Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(""),
                Text("我继承了默认样式"),
                Text(
                  "我继承默认样式,但重新设定了样式",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
                Text("我不继承默认样式",
                  style: TextStyle(
                    inherit: false, // 不继承默认样式
                    color: Colors.orange
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(15),),
          Divider(),
          Directionality(
            textDirection: TextDirection.rtl, // 设置文本方向
            child:Text('Directionality 设置文本方向'),
          ),
        ],
      )
    );
  }
}