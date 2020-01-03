import "package:flutter/material.dart";
import "package:flutter1/widget/LayoutWidget/Column.dart";
import "package:flutter1/widget/LayoutWidget/Expanded.dart";

//[Flutter实战](https://book.flutterchina.club/chapter4/row_and_column.html)
//[官网](https://api.flutter.dev/flutter/widgets/Row-class.html)
/*
作用：线性布局,沿水平方向排布子组件; Row和Column都继承自Flex

继承：
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > MultiChildRenderObjectWidget > Flex > Row

构造函数：（类型 属性 = 默认值）
Row(
  TextDirection textDirection = TextDirection.ltr,
  MainAxisSize mainAxisSize = MainAxisSize.max, // 在主轴(水平)方向占用的空间;表示尽可能多的占用水平方向的空间，此时无论子widgets实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度；
  MainAxisAlignment mainAxisAlignment: MainAxisAlignment.start, //主轴 对齐方式
  CrossAxisAlignment crossAxisAlignment: CrossAxisAlignment.center, // 副轴对齐方式
  VerticalDirection verticalDirection = VerticalDirection.down,//在副轴（垂直）的对齐方向
  <Widget>[] children  ,  
)
*/

class RowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row--线性布局'),),
      body: Column(children: <Widget>[
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Text('Row1Row1Row1 ',style: TextStyle(fontSize: 22.0),),
            Text('Row2Row2 ',style: TextStyle(fontSize: 22.0),),
            Text('Row3 ',style: TextStyle(fontSize: 22.0),),
          ],
        ),
        Text('Row和Column都只会在主轴方向占用尽可能大的空间'),
        Padding(padding: EdgeInsets.all(15),),
        Text('Row默认只有一行，如果超出屏幕不会折行，则会报溢出错误;同Column',style: TextStyle(fontSize: 16.0,color: Colors.red),),
        Text('可以使用Wrap，Flow布局;',style: TextStyle(fontSize: 16.0,color: Colors.red),),
        Padding(padding: EdgeInsets.all(5),),
        Row(
          children: <Widget>[
            Text('Row1 Row1 Row1',style: TextStyle(fontSize: 22.0),),
            Text('Row2 Row2 ',style: TextStyle(fontSize: 22.0),),
            Text('Row3 ',style: TextStyle(fontSize: 22.0),),
            Text('Row3 ',style: TextStyle(fontSize: 22.0),),
            Text('Row3 ',style: TextStyle(fontSize: 22.0),),
            Text('Row3 ',style: TextStyle(fontSize: 22.0),),
          ],
        ),
        Text(''),
        Text('对于行(Row)来说，主轴是水平方向，横轴垂直方向。对于列（Column）来说，主轴垂直方向，横轴水平方向。'),
        OutlineButton(
          child:Text('Column 布局'),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ColumnPage()));
          },
        ),
        OutlineButton(
          child:Text('Expanded 布局'),
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => ExpandedPage()));
          },
        ),
      ],)
    );
  }
}