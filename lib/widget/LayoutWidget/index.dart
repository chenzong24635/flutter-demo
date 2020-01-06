import 'package:flutter/material.dart';

import 'package:flutter1/main.dart';

import 'package:flutter1/widget/LayoutWidget/Container.dart';
import 'package:flutter1/widget/LayoutWidget/padding.dart';
import 'package:flutter1/widget/LayoutWidget/Align.dart';
import 'package:flutter1/widget/LayoutWidget/Center.dart';
import 'package:flutter1/widget/LayoutWidget/Card.dart';
import 'package:flutter1/widget/LayoutWidget/Row.dart';
import 'package:flutter1/widget/LayoutWidget/Column.dart';
import 'package:flutter1/widget/LayoutWidget/Flexible.dart';
import 'package:flutter1/widget/LayoutWidget/Expanded.dart';
import 'package:flutter1/widget/LayoutWidget/Wrap.dart';
import 'package:flutter1/widget/LayoutWidget/Flex.dart';
import 'package:flutter1/widget/LayoutWidget/Flow.dart';

import 'package:flutter1/widget/LayoutWidget/Table.dart';
import 'package:flutter1/widget/LayoutWidget/Transform.dart';
import 'package:flutter1/widget/LayoutWidget/Stack.dart';
import 'package:flutter1/widget/LayoutWidget/IndexedStack.dart';
import 'package:flutter1/widget/LayoutWidget/Positioned.dart';

import 'package:flutter1/widget/LayoutWidget/ConstrainedBox.dart';
import 'package:flutter1/widget/LayoutWidget/DecoratedBox.dart';
import 'package:flutter1/widget/LayoutWidget/FittedBox.dart';
import 'package:flutter1/widget/LayoutWidget/AspectRatio.dart';
import 'package:flutter1/widget/LayoutWidget/Baseline.dart';
import 'package:flutter1/widget/LayoutWidget/FractionallySizedBox.dart';
import 'package:flutter1/widget/LayoutWidget/IntrinsicHeight.dart';
import 'package:flutter1/widget/LayoutWidget/IntrinsicWidth.dart';
import 'package:flutter1/widget/LayoutWidget/LimitedBox.dart';
import 'package:flutter1/widget/LayoutWidget/Offstage.dart';
import 'package:flutter1/widget/LayoutWidget/OverflowBox.dart';
import 'package:flutter1/widget/LayoutWidget/SizedBox.dart';
import 'package:flutter1/widget/LayoutWidget/SizedOverflowBox.dart';
import 'package:flutter1/widget/LayoutWidget/ListBody.dart';
import 'package:flutter1/widget/LayoutWidget/CustomSingleChildLayout.dart';
import 'package:flutter1/widget/LayoutWidget/CustomMultiChildLayout.dart';


// import 'package:flutter1/widget/listview.dart';


final List<String> myRoutesName = <String>[
  'Container',
  'Padding',
  'Align',
  'Center',
  'Card',
  'Row',
  'Column',
  'Flexible',
  'Expanded',
  'Wrap',
  'Flex',
  'Flow',
  'Table',
  'Transform',
  'Stack',
  'IndexedStack',
  'Positioned',
  'ConstrainedBox',
  'DecoratedBox',
  'FittedBox',
  'AspectRatio',
  'Baseline',
  'FractionallySizedBox',
  'IntrinsicHeight',
  'IntrinsicWidth',
  'LimitedBox',
  'Offstage',
  'OverflowBox',
  'SizedBox',
  'SizedOverflowBox',
  'ListBody',
  'CustomSingleChildLayout',
  'CustomMultiChildLayout',
  // 'ListView-滚动列表',
];
Map<String, WidgetBuilder> myRoutes = {
  "ContainerPage": (context) {return new ContainerPage();},
  "PaddingPage": (context) {return new PaddingPage();},
  "AlignPage": (context) {return new AlignPage();},
  "CenterPage": (context) {return new CenterPage();},
  "CardPage": (context) {return new CardPage();},
  "RowPage": (context) {return new RowPage();},
  "ColumnPage": (context) {return new ColumnPage();},
  "FlexiblePage": (context) {return new FlexiblePage();},
  "ExpandedPage": (context) {return new ExpandedPage();},
  "WrapPage": (context) {return new WrapPage();},
  "FlexPage": (context) {return new FlexPage();},
  "FlowPage": (context) {return new FlowPage();},
  "TablePage": (context) {return new TablePage();},
  "TransformPage": (context) {return new TransformPage();},
  "StackPage": (context) {return new StackPage();},
  "IndexedStackPage": (context) {return new IndexedStackPage();},
  "PositionedPage": (context) {return new PositionedPage();},
  "ConstrainedBoxPage": (context) {return new ConstrainedBoxPage();},
  "DecoratedBoxPage": (context) {return new DecoratedBoxPage();},
  "FittedBoxPage": (context) {return new FittedBoxPage();},
  "AspectRatioPage": (context) {return new AspectRatioPage();},
  "BaselinePage": (context) {return new BaselinePage();},
  "FractionallySizedBoxPage": (context) {return new FractionallySizedBoxPage();},
  "IntrinsicHeightPage": (context) {return new IntrinsicHeightPage();},
  "IntrinsicWidthPage": (context) {return new IntrinsicWidthPage();},
  "LimitedBoxPage": (context) {return new LimitedBoxPage();},
  "OffstagePage": (context) {return new OffstagePage();},
  "OverflowBoxPage": (context) {return new OverflowBoxPage();},
  "SizedBoxPage": (context) {return new SizedBoxPage();},
  "SizedOverflowBoxPage": (context) {return new SizedOverflowBoxPage();},
  "ListBodyPage": (context) {return new ListBodyPage();},
  "CustomSingleChildLayoutPage": (context) {return new CustomSingleChildLayoutPage();},
  "CustomMultiChildLayoutPage": (context) {return new CustomMultiChildLayoutPage();},
  // "ListViewPage": (context) {return new ListViewPage();},
};

// void main() => runApp(MyApp());

class LayoutWidget extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyHomePage(),
      routes: myRoutes
    );
  }
}

class MyHomePage extends StatefulWidget {
/*   MyHomePage({Key key, this.title}) : super(key: key);
  final String title; */

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends  State<MyHomePage> {
  var routeLists = myRoutes.keys.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局/容器组件'),
        leading: IconButton( //左边的 Widget。通常放返回键，或者 Drawer 开关
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
          },
        ),
      ),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (context, index) {
            return new InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: new Card(
                child: new Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(15.0),
                  child: new Text(myRoutesName[index],style:TextStyle(fontSize: 18.0)),
                ),
              ),
            );
          },
          itemCount: myRoutesName.length,
        ),
      ),
    );
  }
}