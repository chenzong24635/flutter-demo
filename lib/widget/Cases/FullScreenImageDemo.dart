import 'package:flutter/material.dart';

///共性元素动画
class FullScreenImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("点击图片 全屏显示"),
      ),
      body: Container(
        child: Center(
          child: new InkWell(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (context) {
                    return FullScreenImage();
                  },
                  fullscreenDialog: true
                )
              );
            },
            /// Hero  tag 共享
            child: new Hero(
              tag: "image", //唯一标记，前后两个路由页Hero的tag必须相同
              child: new Image.asset(
                "images/a.jpg",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: new Container(
          alignment: Alignment.center,
          child: new Hero(
            tag: "image", //唯一标记，前后两个路由页Hero的tag必须相同
            child: new Image.asset(
              "images/a.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              // width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
            ),
          ),
        ),
      ),
    );
  }
}
