import 'package:flutter/material.dart';

import 'package:flutter1/main.dart';

import 'package:flutter1/widget/LayoutWidget/container.dart';
import 'package:flutter1/widget/LayoutWidget/padding.dart';
import 'package:flutter1/widget/LayoutWidget/align.dart';
import 'package:flutter1/widget/LayoutWidget/center.dart';
import 'package:flutter1/widget/LayoutWidget/row.dart';
import 'package:flutter1/widget/LayoutWidget/column.dart';
import 'package:flutter1/widget/LayoutWidget/expanded.dart';
import 'package:flutter1/widget/LayoutWidget/wrap.dart';
import 'package:flutter1/widget/LayoutWidget/flex.dart';
import 'package:flutter1/widget/LayoutWidget/flow.dart';
import 'package:flutter1/widget/LayoutWidget/transform.dart';
import 'package:flutter1/widget/LayoutWidget/stack.dart';
import 'package:flutter1/widget/LayoutWidget/positioned.dart';

import 'package:flutter1/widget/LayoutWidget/constrainedBox.dart';
import 'package:flutter1/widget/LayoutWidget/fittedBox.dart';
import 'package:flutter1/widget/LayoutWidget/aspectRatio.dart';


// import 'package:flutter1/widget/listview.dart';


final List<String> myRoutesName = <String>[
  'Container',
  'Padding',
  'Align',
  'Center',
  'Row',
  'Column',
  'Expanded',
  'Wrap',
  'Flex',
  'Flow',
  'Transform',
  'Stack',
  'Positioned',
  'ConstrainedBox',
  'FittedBox',
  'AspectRatio',
  // 'ListView-滚动列表',
];
Map<String, WidgetBuilder> myRoutes = {
  "ContainerPage": (context) {return new ContainerPage();},
  "PaddingPage": (context) {return new PaddingPage();},
  "AlignPage": (context) {return new AlignPage();},
  "CenterPage": (context) {return new CenterPage();},
  "RowPage": (context) {return new RowPage();},
  "ColumnPage": (context) {return new ColumnPage();},
  "ExpandedPage": (context) {return new ExpandedPage();},
  "WrapPage": (context) {return new WrapPage();},
  "FlexPage": (context) {return new FlexPage();},
  "FlowPage": (context) {return new FlowPage();},
  "TransformPage": (context) {return new TransformPage();},
  "StackPage": (context) {return new StackPage();},
  "PositionedPage": (context) {return new PositionedPage();},
  "ConstrainedBoxPage": (context) {return new ConstrainedBoxPage();},
  "FittedBoxPage": (context) {return new FittedBoxPage();},
  "AspectRatioPage": (context) {return new AspectRatioPage();},
  // "ListViewPage": (context) {return new ListViewPage();},
};

// void main() => runApp(MyApp());

class LayoutWidget extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Demo',
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
        title: Text('布局组件'),
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