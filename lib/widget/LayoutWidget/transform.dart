import 'package:flutter/material.dart';

class TransformPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Transform')),
      body: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..rotateZ(15 * 3.1415927 / 180)
          ..scale(1.5),
        child: Container(
          child: Text(
            "Transform",
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(
            color: Colors.red[400],
          ),
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(46.0),
        ),
      ), 
    );
  }
}

