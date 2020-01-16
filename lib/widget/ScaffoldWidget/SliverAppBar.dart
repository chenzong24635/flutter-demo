
import 'package:flutter/material.dart';
//https://blog.csdn.net/u011272795/article/details/82740389
//https://github.com/yechaoa/flutter_sliverappbar
//[](https://api.flutter.dev/flutter/material/SliverAppBar-class.html)
/*
作用：
AppBar 和 SliverAppBar 都是继承StatefulWidget 类，都代表 Toobar，
二者的区别在于 AppBar 位置的固定的应用最上面的；而 SliverAppBar 是可以跟随内容滚动的。

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget SliverAppBar

构造函数：（类型 属性 = 默认值）

const SliverAppBar({
  Key key,
  this.leading,         //左侧标题
  this.automaticallyImplyLeading = true,
  this.title,               //标题
  this.actions,          //菜单
  this.flexibleSpace,        //可以展开区域，通常是一个FlexibleSpaceBar
  this.bottom,         //底部内容区域
  this.elevation,            //阴影
  this.forceElevated = false, 
  this.backgroundColor,       //背景色
  this.brightness,   /主题明亮
  this.iconTheme,  //图标主题
  this.textTheme,    //文字主题
  this.primary = true,  //是否预留高度
  this.centerTitle,     //标题是否居中
  this.titleSpacing = NavigationToolbar.kMiddleSpacing,
  this.expandedHeight,     //展开高度
  this.pinned = false,  //是否固定在顶部
  this.floating = false,       //是否随着滑动隐藏AppBar
  this.snap = false,   //与floating结合使用
})

*/

class SliverAppBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DiscoverListState();
}

class DiscoverListState extends State<SliverAppBarPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: _sliverBuilder,
        body: Center(
          child: ListView.builder(
            itemBuilder: _itemBuilder,
            itemCount: 15,
          ),
        )),
    );
  }

  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        centerTitle: true,//标题居中
        expandedHeight: 200.0,//展开高度200
        floating: false,//不随着滑动隐藏标题
        pinned: true,//固定在顶部
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text('我是一个FlexibleSpaceBar'),
          background: Image.asset(
            "images/a.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      SliverPersistentHeader(
        delegate: _SliverAppBarDelegate(TabBar(
        labelColor: Colors.red,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(icon: Icon(Icons.cake), text: '左侧'),
          Tab(icon: Icon(Icons.golf_course), text: '右侧'),
        ],
        controller: TabController(length: 2, vsync: this),
      )))
    ];
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('无与伦比的标题+$index'),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

