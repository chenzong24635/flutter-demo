import 'package:flutter/material.dart';
import 'package:flutter1/widget/BasicWidget/text.dart';
import 'package:flutter1/widget/BasicWidget/textField.dart';
import 'package:flutter1/widget/BasicWidget/button.dart';
import 'package:flutter1/widget/BasicWidget/checkbox.dart';
import 'package:flutter1/widget/BasicWidget/form.dart';
import 'package:flutter1/widget/BasicWidget/image.dart';
import 'package:flutter1/widget/BasicWidget/progress.dart';
import 'package:flutter1/widget/BasicWidget/icon.dart';

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


import 'package:flutter1/widget/listview.dart';


final List<String> myRoutesName = <String>[
  'Text',
  'TextField',
  'Button',
  'Checkbox Switch',
  'Form',
  'Image',
  'Progress',
  'Icon',
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
  'ListView-滚动列表',
];
Map<String, WidgetBuilder> myRoutes = {
  "TextPage": (context) {return new TextPage();},
  "TextFieldPage": (context) {return new TextFieldPage();},
  "ButtonPage": (context) {return new ButtonPage();},
  "CheckboxSwitchPage": (context) {return new CheckboxSwitchPage();},
  "FormPage": (context) {return new FormPage();},
  "ImagePage": (context) {return new ImagePage();},
  "ProgressPage": (context) {return new ProgressPage();},
  "IconPage": (context) {return new IconPage();},
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
  "ListViewPage": (context) {return new ListViewPage();},
};

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
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
  String msg = 'demo';
  int count = 0;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(msg + count.toString()),
        backgroundColor: Colors.blue,
        brightness: Brightness.dark, // 状态栏上的颜色
        elevation: 5.0, // AppBar 的悬浮高度。值越大下方阴影就越大
        titleSpacing: 30, // 设置 title 的间距
        toolbarOpacity: 0.5, // AppBar的透明度
        leading: IconButton( //左边的 Widget。通常放返回键，或者 Drawer 开关
          icon: Icon(Icons.menu),
          onPressed: () {
            // Navigator.pop(context);
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip
        ),
        actions: <Widget>[ // 右边的操作按钮
          IconButton(
            icon: Icon(Icons.camera),
            onPressed: () {},
            tooltip: 'camera Button Clicked!'
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
            tooltip: 'Share Button Clicked!'
          ),
        ],
        // flexibleSpace:  //配合ScrollView实现下拉展开效果
        /* bottom: TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.white,
          controller: tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList()
        ), */
      ),
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset: false, // 是否避免键盘弹起时挡住视图。默认为true。为false键盘会覆盖在视图上
      bottomNavigationBar: BottomNavigationBar(// 底部导航栏
        items: [
          BottomNavigationBarItem(
            title: Text('首页'),
            icon: Icon(Icons.home), 
            activeIcon: Icon(Icons.pages), //选中时的icon，可略
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('收藏')),
          BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), title: Text('订单')),
        ],
        currentIndex: _currentIndex, // 当前选中的item索引
        fixedColor: Colors.blue, // 选中的item的颜色
        onTap: (index) { // 点击item的回调
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton( // 特殊的漂浮Button
        onPressed: () => setState(() {
          count++;
        }),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // 设置floatingActionButton的位置
      // persistentFooterButtons: // 设置一组底部的Button
      // drawer|Widget-Drawer|抽屉菜单
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