import 'package:flutter/material.dart';

//[](https://flutterchina.club/animations/hero-animations/)
//https://api.flutter.dev/flutter/widgets/Hero-class.html
/*
作用：将 hero从一个路由飞到另一个路由。

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget Hero

构造函数：（类型 属性 = 默认值）

*/

//
class HeroPage extends StatelessWidget {
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Hero '),
      ),
      body: new Column(
        children:<Widget>[
          Text('点击图片，全屏显示',style: TextStyle(fontSize: 22.0),),
          SizedBox(height: 20.0,),
          PhotoHero(
            photo: 'images/a.jpg',
            width: 200.0,
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute<Null>(
                builder: (BuildContext context) {
                  return Scaffold(
                    backgroundColor: Colors.transparent,
                    body: InkWell(
                      onTap: (){Navigator.of(context).pop();},
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.topLeft,
                        child: PhotoHero(
                          photo: 'images/a.jpg',
                          width: double.infinity,
                        ),
                      ),
                    )
                  );
                }
              ));
            },
          ),
        ]
      ),
    );
  }
}


class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.onTap, this.width }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return new Center(
      child: new Hero(
        tag: photo,
        child: new Material(
          color: Colors.transparent,
          child: new InkWell(
            onTap: onTap,
            child: new Image.asset(
              photo,
              width: width,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}