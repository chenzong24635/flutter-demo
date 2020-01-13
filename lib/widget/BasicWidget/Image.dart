import 'package:flutter/material.dart';

import '../Packages/transparent_image.dart';
import '../Packages/cached_network_image.dart';

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

Image()	通用方法，使用ImageProvider实现，如下方法本质上也是使用的这个方法
* Image.asset	加载资源图片
* Image.file	加载本地图片文件
* Image.network	加载网络图片
* Image.memory	加载Uint8List资源图片

项目里的资源图片加载,  
需在pubspec.yaml配置文件，添加图片的路径
flutter:

  uses-material-design: true
  assets:
      - lib/images // 添加所有图片路径
      - lib/images/a.jpg //添加单个
*/

class ImagePage extends StatelessWidget {
  String url = "https://cn.bing.com/th?id=OHR.FrozenTree_ZH-CN9591258534_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp";
  String url1 = "https://cn.bing.com/th?id=OHR.FrozenTree_ZH-CN9591258534_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image')),
      body: ListView(
        children:<Widget>[
          Column(
            children: <Image>[
              //网络图片
              Image.network(url),
              Image.asset("images/th.jpg",width: 100.0,height: 100.0,), //项目内资源图片
              Image(
                image: NetworkImage(url1),
                width: 100.0,
                repeat: ImageRepeat.noRepeat,
                alignment: Alignment.topRight,
                fit: BoxFit.scaleDown, 
                filterQuality: FilterQuality.high,
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
          RaisedButton(
            child: Text('用占位符淡入图片'),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => transparent_image_page()));
            },
          ),
          RaisedButton(
            child: Text('使用缓存图片'),
            onPressed: (){
              // Navigator.push(context,MaterialPageRoute(builder: (context) => cached_image_network_page()));
            },
          ),
        ]

      ),
    );
  }
}


