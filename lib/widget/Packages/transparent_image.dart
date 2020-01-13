// https://pub.dev/packages/transparent_image
//作为一个简单的透明占位图

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class transparent_image_page extends StatelessWidget {
  String url = "https://cn.bing.com/th?id=OHR.SeventeenSolstice_ZH-CN4901756341_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('用占位符淡入图片'),),
      body: FadeInImage.assetNetwork(
            placeholder: 'images/light.jpg',
            image: url,
          ),
    );
  }
}