import 'package:flutter/material.dart';
import 'package:flutter1/widget/LayoutWidget/Positioned1.dart';

/*

const Positioned({
  Key key,
  this.left,
  this.top,
  this.right,
  this.bottom,
  this.width,
  this.height,
  @required Widget child,
})
*/

class PositionedPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Positioned -- 层叠布局')),
      body: Column(
        children: <Widget>[
          Stack(
            children:<Widget>[
              Image.network("https://cn.bing.com/th?id=OHR.FrozenTree_ZH-CN9591258534_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp"),
              Positioned(
                top: 10,
                left: MediaQuery.of(context).size.width / 5,
                child: Text(
                  '这里是定位的文本',
                  style:TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                  )
                ),
              ),
            ]
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return PositionedPage1();
              }));
            },
            child: Text('更多'),
          )
        ],
      )
    );
  }
}
