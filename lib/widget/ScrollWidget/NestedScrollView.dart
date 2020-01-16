import 'package:flutter/material.dart';

//[](https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html)
/*
作用：一个可以嵌套其它可滚动widget的widget

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget NestedScrollView

构造函数：（类型 属性 = 默认值）

*/

class NestedScrollViewPage extends StatefulWidget {
  final String title = 'NestedScrollView';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NestedScrollViewPage>{

  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    setState(() { // Causes the app to rebuild with the new _selectedChoice.
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: choices.length,
        child: Scaffold(
          // appBar: AppBar(title: Text('NestedScrollView'),),
          body: NestedScrollView(
            headerSliverBuilder: _headerSliverBuilder,
            body : TabBarView(
              children: choices.map((Choice choice) {
                return new Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new ChoiceCard(choice: choice),
                );
              }).toList(),
            ),
          )
        )
    );
  }

  List<Widget> _headerSliverBuilder(BuildContext context, bool innerBoxIsScrolled){
    return <Widget>[
    SliverAppBar(
      //1.在标题左侧显示的一个控件，在首页通常显示应用的 logo；在其他界面通常显示为返回按钮

      //2. ? 控制是否应该尝试暗示前导小部件为null
      automaticallyImplyLeading:true ,

      //3.当前界面的标题文字
      title: Text(_selectedChoice.title,style:TextStyle(fontSize: 22.0,color: Colors.black)),

      //4.一个 Widget 列表，代表 Toolbar 中所显示的菜单，对于常用的菜单，通常使用 IconButton 来表示；
      //对于不常用的菜单通常使用 PopupMenuButton 来显示为三个点，点击后弹出二级菜单
      actions: <Widget>[
        new PopupMenuButton<Choice>( // overflow menu
          onSelected: _select,
          itemBuilder: (BuildContext context) {
            return choices.skip(2).map((Choice choice) {
              return new PopupMenuItem<Choice>(
                value: choice,
                child: new Text(choice.title),
              );
            }).toList();
          },
        )
      ],

      //5.一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样，
      // 可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Image(
            image: AssetImage('images/th.jpg'),
            fit: BoxFit.cover,
          ),
        ),

      //6.一个 AppBarBottomWidget 对象，通常是 TabBar。用来在 Toolbar 标题下面显示一个 Tab 导航栏
      bottom: new TabBar(
        unselectedLabelColor: Colors.white,
        labelColor: Colors.amber,
        isScrollable: true,
        tabs: choices.map((Choice choice) {
          return new Tab(
            text: choice.title,
            icon: new Icon(choice.icon),
          );
        }).toList(),
      ) ,

      //7.? 材料设计中控件的 z 坐标顺序，默认值为 4，对于可滚动的 SliverAppBar，
      // 当 SliverAppBar 和内容同级的时候，该值为 0， 当内容滚动 SliverAppBar 变为 Toolbar 的时候，修改 elevation 的值
      elevation: 1,

      //APP bar 的颜色，默认值为 ThemeData.primaryColor。改值通常和下面的三个属性一起使用
      backgroundColor: Colors.red,

      //App bar 的亮度，有白色和黑色两种主题，默认值为 ThemeData.primaryColorBrightness
      brightness:Brightness.light ,

      //App bar 上图标的颜色、透明度、和尺寸信息。默认值为 ThemeData().primaryIconTheme
      iconTheme: ThemeData().primaryIconTheme,

      //App bar 上的文字主题。默认值为 ThemeData（）.primaryTextTheme
      textTheme: ThemeData().accentTextTheme,

      //此应用栏是否显示在屏幕顶部
      primary: true,

      //标题是否居中显示，默认值根据不同的操作系统，显示方式不一样,true居中 false居左
      centerTitle: true,

      //横轴上标题内容 周围的间距
      titleSpacing: NavigationToolbar.kMiddleSpacing,

      //展开高度
      expandedHeight: 200,

      //是否随着滑动隐藏标题
      floating: true,

      //tab 是否固定在顶部
      pinned: true,

      //与floating结合使用
      snap: true,

    )
    ];
  }
}


class Choice {
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;

    Widget _itemBuilder(BuildContext context,int index){
      return ListTile(
        leading: Icon(choice.icon),
        title: Text("this is a " + choice.title),
      );
    }

    return new Card(
      color: Colors.white,
      // child: Center(
      //   child: ListView.builder(
      //       itemBuilder: _itemBuilder,
      //       itemCount: 30,
      //   ),
      // ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

