import "package:flutter/material.dart";

class ExpandedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded'),
      ),
      body: Column(
        children: <Widget>[
          Text('在 Row, Column, 或者 Flex 容器中，有时需要让之中一个 Widget 将容器主轴上的剩余空间充满，这时通过在 Widget 上包裹一层 Expended，就能轻松实现。',style:TextStyle(fontSize: 20.0)),
          Row(
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