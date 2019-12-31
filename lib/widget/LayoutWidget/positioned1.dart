import 'package:flutter/material.dart';

class PositionedPage1 extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Positioned -- 层叠布局')),
      body: Stack(
        alignment:Alignment.center ,
        fit: StackFit.expand, //未定位widget占满Stack整个空间
        children: <Widget>[
          Positioned(
            left: 18.0,
            child: Text("AAAAAAAAAAAAA"),
          ),
          Container(child: Text("由于第二个子文本组件没有定位，所以fit属性会对它起作用，就会占满Stack",style: TextStyle(color: Colors.white)),
            color: Colors.red,
          ),
          Positioned(
            top: 18.0,
            child: Text("BBBBBBBBBB"),
          )
        ],
      ),
    );
  }
}
