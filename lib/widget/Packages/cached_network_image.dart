// https://pub.dev/packages/cached_network_image
//缓存图片 还支持占位符和淡入淡出图片！

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class cached_image_network_page extends StatelessWidget {
  String url = "https://cn.bing.com/th?id=OHR.SeventeenSolstice_ZH-CN4901756341_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('使用缓存图片'),),
      body: Column(children: <Widget>[
        Text('da'),
        // CachedNetworkImage(
        //     imageUrl: url,
        //     placeholder: (context, url) => CircularProgressIndicator(),
        //     errorWidget: (context, url, error) => Icon(Icons.error),
        // ),
      ],)
    );
  }
}