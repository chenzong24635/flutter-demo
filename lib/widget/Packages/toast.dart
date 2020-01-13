//https://pub.dev/packages/toast

/*
msg	 //String (Not Null)(required) 弹窗内容
context	BuildContext  //(Not Null)(required)
duration	//Toast.LENGTH_SHORT | Toast.LENGTH_LONG (optional) 弹窗时间
gravity	//Toast.TOP | Toast.CENTER | Toast.BOTTOM 弹窗位置
textColor	Color (default white)
backgroundColor	Color (default Color(0xAA000000))
backgroundRadius	double （default 16)
border	Border (optional)
*/

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ToastPage extends StatelessWidget {
  const ToastPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Toast'),),
      body: Column(children: <Widget>[
        InkWell(
          child: Text('顶部的Toast ',style: TextStyle(fontSize: 22.0),),
          onTap: (){
            Toast.show(
              "Toast plugin app", context, 
              duration: Toast.LENGTH_SHORT,
              gravity:  Toast.TOP
            );
          },
        ),
        InkWell(
          child: Text('中间的Toast ',style: TextStyle(fontSize: 22.0),),
          onTap: (){
            Toast.show(
              "Toast plugin app", context, 
              duration: Toast.LENGTH_SHORT,
              gravity:  Toast.CENTER
            );
          },
        ),
        InkWell(
          child: Text('底部的Toast ',style: TextStyle(fontSize: 22.0),),
          onTap: (){
            Toast.show(
              "Toast plugin app", context, 
              duration: Toast.LENGTH_LONG,
              gravity:  Toast.BOTTOM
            );
          },
        ),
      ],),
    );
  }
}