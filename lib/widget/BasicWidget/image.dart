import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image')),
      body: ListView(
        children: <Image>[
          //网络图片
          Image.network("https://cn.bing.com/th?id=OHR.FrozenTree_ZH-CN9591258534_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp"),
          Image.asset("lib/images/th.jpg",width: 100.0,height: 100.0,), //项目内资源图片
          // Image.file( File("/Users/gs/Downloads/1.jpeg")), // 本地图片
          // Image.memory(Uint8List bytes, ...) // Uint8List资源图片
          Image(
            image: NetworkImage("https://cn.bing.com/th?id=OHR.FrozenTree_ZH-CN9591258534_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp"),
            width: 100.0,
            // height: 200.0,
            repeat: ImageRepeat.noRepeat, //重复方式
            alignment: Alignment.topRight, //对齐方式
            fit: BoxFit.scaleDown, //图片适应方式,(拉伸，充满...)
            filterQuality: FilterQuality.high, //图片的质量
            // centerSlice: new Rect.fromCircle(center: const Offset(20.0, 20.0), radius: 10.0 ), //当图片需要被拉伸显示的时候，centerSlice定义的矩形区域会被拉伸
            //color和colorBlendMode一般配合使用
            color: Colors.greenAccent, // 背景色
            colorBlendMode: BlendMode.colorBurn, // 混合模式
            matchTextDirection: true, //与Directionality配合使用
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