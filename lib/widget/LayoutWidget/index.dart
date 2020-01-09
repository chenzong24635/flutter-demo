import 'package:flutter/material.dart';

import 'package:flutter1/main.dart';

import './Container.dart';
import './padding.dart';
import './Align.dart';
import './Center.dart';
import './Card.dart';
import './ListTile.dart';
import './Row.dart';
import './Column.dart';
import './Flexible.dart';
import './Expanded.dart';
import './Wrap.dart';
import './Flex.dart';
import './Flow.dart';

import './Table.dart';
import './Transform.dart';
import './Stack.dart';
import './IndexedStack.dart';
import './Positioned.dart';

import './ButtonBar.dart';

import './ConstrainedBox.dart';
import './DecoratedBox.dart';
import './FittedBox.dart';
import './AspectRatio.dart';
import './Baseline.dart';
import './FractionallySizedBox.dart';
import './IntrinsicHeight.dart';
import './IntrinsicWidth.dart';
import './LimitedBox.dart';
import './Offstage.dart';
import './OverflowBox.dart';
import './SizedBox.dart';
import './SizedOverflowBox.dart';
import './ListBody.dart';
import './CustomSingleChildLayout.dart';
import './CustomMultiChildLayout.dart';


// import 'package:flutter1/widget/listview.dart';


final List<String> myRoutesName = <String>[
  'Container',
  'Padding',
  'Align',
  'Center',
  'Card',
  'ListTile',
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
  'ButtonBar',
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
  "ListTilePage": (context) {return new ListTilePage();},
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
  "ButtonBarPage": (context) {return new ButtonBarPage();},
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