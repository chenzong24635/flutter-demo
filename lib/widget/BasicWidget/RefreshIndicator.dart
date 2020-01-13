import 'package:flutter/material.dart';

//[](https://api.flutter.dev/flutter/material/RefreshIndicator-class.html)
/*
作用：滑动刷新的loading小组件

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget RefreshIndicator

构造函数：（类型 属性 = 默认值）
  const RefreshIndicator({
    Key key,
    @required this.child,
    this.displacement = 40.0,
    @required this.onRefresh,
    this.color,
    this.backgroundColor,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.semanticsLabel,
    this.semanticsValue,
  })
*/
class RefreshIndicatorPage extends StatefulWidget {
  RefreshIndicatorPage({Key key}) : super(key: key);

  @override
  _RefreshIndicatorPageState createState() => _RefreshIndicatorPageState();
}

class _RefreshIndicatorPageState extends State<RefreshIndicatorPage> {

  Future<Null> _pullToRefresh() async {
  //下拉刷新做处理
    setState(() {
      //改变数据，这里随意发挥
      print('下拉操作');
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('RefreshIndicator'),),
      body: RefreshIndicator(
        child: ListView(children: <Widget>[
          Text('下拉刷新')
        ],), 
        onRefresh: _pullToRefresh
      ),
    );
  }
}
