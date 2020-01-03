import "package:flutter/material.dart";
import "package:flutter1/widget/LayoutWidget/Expanded.dart";

//[]()
//[官网](https://api.flutter.dev/flutter/widgets/Flexible-class.html)
/*
作用：控制Row、Column、Flex等子组件布局

继承：Object > Diagnosticable > DiagnosticableTree > Widget > ProxyWidget > ParentDataWidget<Flex> > Flexible

构造函数：（类型 属性 = 默认值）

Flexible(
  Key key,
  int flex = 1,
  FlexFit fit = FlexFit.loose, //子组件如何使用剩余空间
  @required Widget child,
)    
*/

class FlexiblePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flexible'),
      ),
      body: Column(
        children: <Widget>[
          Text('FlexFit.loose',style:TextStyle(fontSize: 20.0)),
          Row(
            children: <Widget>[
              Flexible(
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
          Padding(padding: EdgeInsets.all(10),),
          Text('FlexFit.tight',style:TextStyle(fontSize: 20.0)),
          Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
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
          OutlineButton(
            child: Text('Expanded布局',style:TextStyle(color: Colors.red)),
            onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ExpandedPage()))
          ),
        ],
      ),
    );
  }
}