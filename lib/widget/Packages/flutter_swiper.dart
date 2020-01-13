//轮播图
// https://pub.dev/packages/flutter_swiper

// [详情](https://github.com/best-flutter/flutter_swiper/blob/master/README-ZH.md)

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class flutter_swiper_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: 'Flutter Demo Home Page');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
        },
        itemCount: 3,
        pagination: SwiperPagination(),
        control: SwiperControl(),
        loop: true,
        autoplay: true,
        duration: 500,
      ),
    );
  }
}