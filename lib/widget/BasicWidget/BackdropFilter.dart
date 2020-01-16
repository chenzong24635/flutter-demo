import 'package:flutter/material.dart';
import 'dart:ui';

//https://api.flutter.dev/flutter/widgets/BackdropFilter-class.html
/*
作用：
对背景图片进行高斯模糊设置或者矩阵变换，除了图片以外BackdropFilter还能对任何子widget进行高斯模糊设置

需要注意的是BackdropFilter不是变换背景来实现高斯模糊的效果，而是通过在背景上面盖上一个模糊层从而达到高斯模糊的效果，
因此要做模糊的背景图必须要在BackdropFilter底下,一般通过通过Stack来控制布局的层次摆放

`这种效果相对昂贵，尤其是当滤镜是非局部的（例如blur）时,优先考虑使用DecoratedBox，Opactiy`

继承：Object Diagnosticable DiagnosticableTree Widget RenderObjectWidget SingleChildRenderObjectWidget BackdropFilter

构造函数：（类型 属性 = 默认值）
  const BackdropFilter({
    Key key,
    @required this.filter, //它是个ImageFilter类型，ImageFilter有两种构造方法，分别是用来设置背景高斯模糊以及矩阵变换的：
    Widget child,
  }) 

构造一个设置高斯模糊的ImageFilter，sigmaX，sigmaY用来控制
模糊度，数值越大模糊度越高
ImageFilter.blur({
  double sigmaX: 0.0, 
  double sigmaY: 0.0 
})

矩阵变换
ImageFilter.matrix(
  Float64List matrix4, 
  { FilterQuality filterQuality: FilterQuality.low }
)
*/

class BackdropFilterPage extends StatelessWidget  {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('BackdropFilter-高斯模糊效果'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Text('0' * 10000),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 25.0,
                  sigmaY: 5.0,
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 200.0,
                  height: 200.0,
                  child: Text('Hello World'),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
