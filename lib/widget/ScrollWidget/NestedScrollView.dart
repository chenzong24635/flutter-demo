import 'package:flutter/material.dart';

import '../ScaffoldWidget/SliverAppBar.dart';

//[](https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html)
/*
作用：一个可以嵌套其它可滚动widget的widget

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget NestedScrollView

构造函数：（类型 属性 = 默认值）

*/

class NestedScrollViewPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NestedScrollViewPage>{

  Choice _selectedChoice = choices[0];

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
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
        automaticallyImplyLeading:true ,
        title: Text(_selectedChoice.title,style:TextStyle(fontSize: 22.0,color: Colors.black)),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.skip(2).map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          )
        ],
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Image(
            image: AssetImage('images/th.jpg'),
            fit: BoxFit.cover,
          ),
        ),
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
        elevation: 1,
        backgroundColor: Colors.red,
        brightness:Brightness.light ,
        iconTheme: ThemeData().primaryIconTheme,
        textTheme: ThemeData().accentTextTheme,
        primary: true,
        centerTitle: true,
        titleSpacing: NavigationToolbar.kMiddleSpacing,
        expandedHeight: 200,
        floating: true,
        pinned: true,
        snap: true,
      ),
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

