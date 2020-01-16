import "package:flutter/material.dart";
import "package:flutter1/widget/LayoutWidget/Row.dart";
import "package:flutter1/widget/LayoutWidget/Expanded.dart";

//https://api.flutter.dev/flutter/widgets/Column-class.html
/*
作用：线性布局,沿垂直方向排布子组件; Row和Column都继承自Flex
    参数和Row一样，不同的是布局方向为垂直，主轴纵轴正好相反

继承：
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > MultiChildRenderObjectWidget > Flex > Column

构造函数：（类型 属性 = 默认值）
Row(
  TextDirection textDirection = TextDirection.ltr,
  MainAxisSize mainAxisSize = MainAxisSize.max, // 在主轴(垂直)方向占用的空间;表示尽可能多的占用水平方向的空间，此时无论子widgets实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度；
  MainAxisAlignment mainAxisAlignment: MainAxisAlignment.start, //主轴 对齐方式
  CrossAxisAlignment crossAxisAlignment: CrossAxisAlignment.center, // 副轴对齐方式
  VerticalDirection verticalDirection = VerticalDirection.down,//在副轴（水平）的对齐方向
  <Widget>[] children  ,  
)
*/

class ColumnPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column--线性布局'),),
      body: Column(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        // verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Text('11',style: TextStyle(fontSize: 22.0),),
          Text('1',style: TextStyle(fontSize: 22.0),),
          Text('1',style: TextStyle(fontSize: 22.0),),
          Text('对于行(Row)来说，主轴是水平方向，横轴垂直方向。对于列（Column）来说，主轴垂直方向，横轴水平方向。'),
          Text('Row和Column都只会在主轴方向占用尽可能大的空间'),
          Text('2'),
          Text('如果子widget超出屏幕范围，则会报溢出错误',style: TextStyle(fontSize: 16.0,color: Colors.red),),
          Text('可以使用Wrap，Flow布局',style: TextStyle(fontSize: 16.0,color: Colors.red),),
          Text('可以包在ListVIew里',style: TextStyle(fontSize: 16.0,color: Colors.red),),
          OutlineButton(
            child:Text('Row 布局'),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => RowPage()));
            },
          ),
          OutlineButton(
            child:Text('Expanded 布局'),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => ExpandedPage()));
            },
          ),
          Padding(
            child: Text('222222'),
            padding: EdgeInsets.all(300.0),
          ),
          
        ],
      ),
      
    );
  }
}