
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
  this.automaticallyImplyLeading = true, //控制是否应该尝试暗示前导小部件为null
  this.title,               //标题
  this.actions,          //菜单
  this.flexibleSpace,   // 一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样，可以展开区域，通常是一个FlexibleSpaceBar
  this.bottom,         //通常是 TabBar。用来在 Toolbar 标题下面显示一个 Tab 导航栏
  this.elevation,            //阴影
  this.forceElevated = false, 
  this.backgroundColor,       //背景色
  this.brightness,   /主题明亮
  this.iconTheme,  //图标主题(颜色、透明度、和尺寸信息)
  this.textTheme,    //文字主题
  this.primary = true,  //是否预留高度,应用栏是否显示在屏幕顶部
  this.centerTitle,     //标题是否居中
  this.titleSpacing = NavigationToolbar.kMiddleSpacing, //横轴上标题内容 周围的间距
  this.expandedHeight,     //展开高度
  this.pinned = false,  //tab 是否固定在顶部
  this.floating = false,       //是否随着滑动隐藏标题
  this.snap = false,   //与floating结合使用
})

*/


/* 
SliverPersistentHeader(
  delegate: _SliverAppBarDelegate(
    TabBar(
      labelColor: Colors.red,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Tab(icon: Icon(Icons.cake), text: '左侧'),
        Tab(icon: Icon(Icons.golf_course), text: '右侧'),
      ],
      controller: TabController(length: 2, vsync: this),
    ),
  ),
), 
*/

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('无与伦比的标题+$index'),
    );
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

