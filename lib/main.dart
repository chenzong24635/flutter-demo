import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter1/widget/BasicWidget/index.dart';
import 'package:flutter1/widget/LayoutWidget/index.dart';
import 'package:flutter1/widget/ScrollWidget/index.dart';




final List<String> myRoutesName = <String>[
  '基础组件',
  '布局组件',
  '滚动组件',
];
Map<String, WidgetBuilder> myRoutes = {
  "/BasicWidget": (context) {return new BasicWidget();},
  "/LayoutWidget": (context) {return new LayoutWidget();},
  "/ScrollWidget": (context) {return new ScrollWidget();},
};

void main() {
  debugPaintSizeEnabled = !true;
  runApp(MyApp());
}

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
            Navigator.pop(context);
            // Navigator.of(context).pushReplacementNamed("/login");
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
        child: new GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //每行三列
            childAspectRatio: 1.0 //显示区域宽高相等
          ),
          itemCount: myRoutesName.length,
          itemBuilder: (context, index) {
            return new InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: new Card(
                child: new Container(
                  alignment: Alignment.center,
                  // padding: EdgeInsets.all(15.0),
                  child: new Text(myRoutesName[index],style:TextStyle(fontSize: 18.0)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}