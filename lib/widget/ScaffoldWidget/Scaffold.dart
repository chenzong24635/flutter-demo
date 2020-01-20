import 'package:flutter/material.dart';

// import './AppBar.dart';
// import './SliverAppBar.dart';
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
  List tabs = ["Tab1", "Tab2", "Tab3","Tab4","Tab5","Tab6","Tab7"];
  List<Widget> tabs1 = [
    Column(
      children: <Widget>[
        Text('PageA',style: TextStyle(fontSize: 22.0),),
      ],
    ),
    Column(
      children: <Widget>[
        Text('PageB',style: TextStyle(fontSize: 22.0),)
      ],
    ),
    Column(
      children: <Widget>[
        Text('PageC',style: TextStyle(fontSize: 22.0),)
      ],
    ),
    Text('D'),
    Text('E'),
    Text('F'),
    Text('G'),
  ];

  bool barType = true;
  
  void _change(){
    setState(() {
      //改变悬浮窗样式
      barType = !barType;
    });
    // scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    // 创建Controller  
    _tabController = TabController(
      initialIndex: 3, // 初始选中第几个
      length: tabs.length, 
      vsync: this
    );
  }

  //当整个页面dispose时，把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("Scaffold"), 
        // title: TabBar( //也可以设在title位置
        //   isScrollable: true,
        //   controller: _tabController,
        //   tabs: tabs.map((e) => Tab(text: e)).toList()
        // ), 
        backgroundColor: Colors.red,
        toolbarOpacity: .8,
        bottomOpacity: .6,
        actions: <Widget>[ 
          /* FlatButton(
            child: Text('SliverAppBarPage用法'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SliverAppBarPage()));
              // scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ), */ 
          IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.of(context).pop();
          }),
        ],
        bottom: TabBar(  
          isScrollable: true, //是否滚动
          labelColor: Colors.limeAccent,
          labelPadding: EdgeInsets.only(left:30.0,right: 30.0),
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.amber,
          indicatorWeight: 5.0,
          indicatorPadding: EdgeInsets.all(3.0),
          indicatorSize: TabBarIndicatorSize.tab,
          // indicator: Decoration(),
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList()
        ),
      ),
      drawer: DrawerPage(),
      // endDrawer: DrawerPage(), 
      drawerEdgeDragWidth: 100.0,
      drawerScrimColor: Colors.brown,
      // bottomSheet: DrawerPage(), 
      // 悬浮按钮设置
      bottomNavigationBar: barType ? BottomNavigationBarPage() : BottomNavigationBar1Page(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton( 
          child: Icon(Icons.crop_16_9),
          onPressed: _change
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

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('1');
  }
}
class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('2');
  }
}
class Page3 extends StatelessWidget {
  const Page3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('3');
  }
}