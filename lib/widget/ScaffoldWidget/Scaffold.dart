import 'package:flutter/material.dart';

// import './AppBar.dart';
import './Drawer.dart';
import './BottomNavigationBar.dart';
import './BottomNavigationBar1.dart';

//[Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html)
/*
作用：

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatefulWidget > Scaffold


构造函数：（类型 属性 = 默认值）
const Scaffold({
  Key key,
  this.appBar, // 头部栏
  this.body, //内容
  this.backgroundColor,

  this.bottomNavigationBar, // 底部导航栏
  this.floatingActionButton, // 浮在右下角的按钮
  this.floatingActionButtonLocation, // 浮在右下角的按钮 位置
  this.floatingActionButtonAnimator, //


  this.drawer, //抽屉(左上角)
  this.endDrawer, //抽屉(右上角，会被actions覆盖)
  this.drawerEdgeDragWidth, //抽屉宽度
  this.drawerScrimColor, //打开抽屉时，剩余空间的背景色
  this.drawerDragStartBehavior = DragStartBehavior.start, // 确定拖动开始行为的处理方式

  this.persistentFooterButtons, // 一组显示在支架底部的按钮
  this.bottomSheet, // 显示的永久性底页
  this.resizeToAvoidBottomPadding,
  this.resizeToAvoidBottomInset,  // 是否避免键盘弹起时挡住视图。默认为true。为false键盘会覆盖在视图上
  this.primary = true,
  this.extendBody = false,
  this.extendBodyBehindAppBar = false,
})
*/

class ScaffoldPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScaffoldBox();
  }
}

class ScaffoldBox extends StatefulWidget {
  @override
  _ScaffoldBoxState createState() => _ScaffoldBoxState();
}


final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('看这里 Showing Snackbar'));

class _ScaffoldBoxState extends State<ScaffoldBox> with SingleTickerProviderStateMixin{
  
  TabController _tabController; //定义一个Controller
  List tabs = ["A", "B", "C"];
  List<Widget> tabs1 = [
    Column(
      children: <Widget>[Text('aaa'),Text('aaa'),Text('aaa')],
    ),
    Column(
      children: <Widget>[Text('bbb'),Text('b'),Text('b')],
    ),
    Column(
      children: <Widget>[Text('ccc'),Text('c'),Text('c')],
    ),
  ];

  void _onAdd(){
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    // 创建Controller  
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("Scaffold"), 
        backgroundColor: Colors.red,
        toolbarOpacity: .8,
        bottomOpacity: .6,
        actions: <Widget>[ 
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ), 
          IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.of(context).pop();
          }),
        ],
        bottom: TabBar(  
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList()
        ),
      ),
      drawer: DrawerPage(),
      // endDrawer: DrawerPage(), 
      drawerEdgeDragWidth: 100.0,
      drawerScrimColor: Colors.brown,
      // bottomSheet: DrawerPage(), 
      // bottomNavigationBar: BottomNavigationBarPage(),
      // 悬浮按钮设置
      bottomNavigationBar: BottomNavigationBar1Page(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton( 
          child: Icon(Icons.add),
          onPressed:_onAdd
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs1.map((e) { //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: e,
          );
        }).toList(),
      ),
    );
  }
}


//[AppBar](https://api.flutter.dev/flutter/material/Scaffold/AppBar.html)
/*
作用：页面头部栏

继承：继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatefulWidget > AppBar

构造函数：（类型 属性 = 默认值）
  AppBar({
    Key key,
    this.leading, //左边的 Widget。通常放返回键，或者 Drawer 开关图标
    this.automaticallyImplyLeading = true,
    this.title, // 页面title
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,  // title 的间距
    this.centerTitle, // title是否居中
    this.actions, // 右边的Widget
    this.toolbarOpacity = 1.0, // AppBar的透明度
    this.flexibleSpace, //配合ScrollView实现下拉展开效果
    this.bottom, // 头部栏下方的tab切换栏
    this.bottomOpacity = 1.0, // 头部栏下方的tab切换栏的透明度
    this.elevation, // AppBar 的悬浮高度。值越大下方阴影就越大
    this.shape, // 形状及其阴影
    this.backgroundColor, //背景色
    this.brightness = Brightness.dark, // 状态栏上的颜色 
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true, // 此应用栏是否显示在屏幕顶部
  })
 */

