// 例子来源：https://github.com/CarGuo/gsy_flutter_demo

import 'package:flutter/material.dart';

import 'package:flutter1/main.dart';

import './demo.dart';
import './ScrollListenerDemo.dart';
import './RefreshListDemo.dart';
import './RefreshListDemo2.dart';
import './SliverTabDemo.dart';
import './sliver_tab/sliver_tab_demo_page3.dart';
import './stick/stick_demo_page.dart';
import './stick/stick_demo_page2.dart';

import './FullScreenImageDemo.dart';
import './drop_select_menu/drop_select_demo_page.dart';
import './FloatingTouchDemo.dart';
import './VerificationCodeInputDemo.dart';
import './KeyboardDemo.dart';
import './TickClickDemo.dart';
import './bubble/bubble_demo_page.dart';



final List<String> myRoutesName = <String>[
  'DemoPage',
  '列表滑动监听',
  '列表加载1 loading图标',
  '列表加载2 loading图标',
  '左右滑动列表',
  '左右滑动列表3',
  'StickDemoPage',
  'StickExpendDemoPage',
  '点击图片 全屏显示',
  'DropSelect',
  '创建全局悬浮按键',
  '验证码输入框',
  '监听键盘是否弹起',
  'TickClickDemoPage',
  '提示弹框',
];
Map<String, WidgetBuilder> myRoutes = {
  "DemoPage": (context) => TransformDemoPage(),
  "ScrollListenerPage": (context) => ScrollListenerPage(),
  "RefreshDemoPage": (context) => RefreshDemoPage(),
  "RefreshDemoPage2": (context) => RefreshDemoPage2(),
  "SliverTabDemoPage": (context) => SliverTabDemoPage(),
  "SliverTabDemoPage3": (context) => SliverTabDemoPage3(),
  "StickDemoPage": (context) => StickDemoPage(),
  "StickExpendDemoPage": (context) => StickExpendDemoPage(),
  "FullScreenImagePage": (context) => FullScreenImagePage(),
  "DropSelectDemoPage": (context) => DropSelectDemoPage(),
  "FloatingTouchDemoPage": (context) => FloatingTouchDemoPage(),
  "VerificationCodeInputDemoPage": (context) => VerificationCodeInputDemoPage(),
  "KeyBoardDemoPage": (context) => KeyBoardDemoPage(),
  "TickClickDemoPage": (context) => TickClickDemoPage(),
  "BubbleDemoPage": (context) => BubbleDemoPage(),
};


class CasesWidget extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyHomePage(),
      routes: myRoutes
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends  State<MyHomePage> {
  var routeLists = myRoutes.keys.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('常用例子'),
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