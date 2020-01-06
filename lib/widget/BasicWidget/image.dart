import 'package:flutter/material.dart';

//[Image](https://api.flutter.dev/flutter/widgets/Image-class.html)
/*
作用：

继承：继承： Object > Diagnosticable > DiagnosticableTree > Widget > StatefulWidget > Image

构造函数：（类型 属性 = 默认值）
const Image({
  Key key,
  @required this.image,
  this.frameBuilder,
  this.loadingBuilder,
  this.semanticLabel,
  this.excludeFromSemantics = false,
  this.width,
  this.height,
  this.color, //color和colorBlendMode一般配合使用
  this.colorBlendMode, // 混合模式
  this.fit, //图片适应方式,(拉伸，充满...)
  this.alignment = Alignment.center,  //对齐方式
  this.repeat = ImageRepeat.noRepeat,  //重复方式
  this.centerSlice,  //当图片需要被拉伸显示的时候，centerSlice定义的矩形区域会被拉伸
  this.matchTextDirection = false, //与Directionality配合使用
  this.gaplessPlayback = false,
  this.filterQuality = FilterQuality.low,  //图片的质量
})
*/

class ImagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image')),
      body: ListView(
        children: <Image>[
          //网络图片
          Image.network("https://cn.bing.com/th?id=OHR.FrozenTree_ZH-CN9591258534_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp"),
          Image.asset("images/th.jpg",width: 100.0,height: 100.0,), //项目内资源图片
          // Image.file( File("/Users/gs/Downloads/1.jpeg")), // 本地图片
          // Image.memory(Uint8List bytes, ...) // Uint8List资源图片
          Image(
            image: NetworkImage("https://cn.bing.com/th?id=OHR.FrozenTree_ZH-CN9591258534_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp"),
            width: 100.0,
            // height: 200.0,
            repeat: ImageRepeat.noRepeat,
            alignment: Alignment.topRight,
            fit: BoxFit.scaleDown, 
            filterQuality: FilterQuality.high,
            // centerSlice: new Rect.fromCircle(center: const Offset(20.0, 20.0), radius: 10.0 ),
            
            color: Colors.greenAccent,
            colorBlendMode: BlendMode.colorBurn, 
            matchTextDirection: true, 
          ),
        ].map((e){
          return Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 200,
                  child: e,
                ),
              ),
              Text('fit属性：'+e.fit.toString())
            ],
          );
        }).toList(),
      ),
    );
  }
}