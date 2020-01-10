import "package:flutter/material.dart";

class FlexPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flex'),
      ),
      body: Column(
        children: <Widget>[
          Text('Row和Column都继承自Flex，参数基本相同，所以能使用Flex的地方基本上都可以使用Row或Column。',style:TextStyle(fontSize: 20.0)),
          Padding(padding: EdgeInsets.all(10),),
          Text('如果轴向不确定，使用Flex，通过修改direction的值设定轴向 ;如果轴向已确定，使用Row，Column，布局更简洁，更有语义化',style:TextStyle(fontSize: 20.0)),
          Padding(padding: EdgeInsets.all(10),),
          Flex(
            direction: Axis.horizontal, // 弹性布局的方向, Row默认为水平方向，Column默认为垂直方向
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.end, //主轴 对齐方式
            crossAxisAlignment: CrossAxisAlignment.center, // 副轴对齐方式
            mainAxisSize: MainAxisSize.min,// 在主轴(水平)方向占用的空间，默认是MainAxisSize.max，表示尽可能多的占用水平方向的空间，此时无论子widgets实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度；
            verticalDirection: VerticalDirection.down,//在纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。
            children: <Widget>[
              Expanded(
                flex: 2, //flex参数为弹性系数，如果为0或null，则child是没有弹性的，即不会被扩伸占用的空间。如果大于0，所有的Expanded按照其flex的比例来分割主轴的全部空闲空间。
                child: Container(
                  color: Colors.amber,
                  height: 100,
                  child: Text('1'),
                ),
              ),
              Container(
                color: Colors.blue,
                height: 100,
                width: 50,
                child: Text('2'),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.amber,
                  height: 100,
                  child: Text('3'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}