import 'package:flutter/material.dart';

//[]()
/*
作用：
导航返回拦截

为了避免用户误触返回按钮而导致APP退出

继承：

构造函数：（类型 属性 = 默认值）
  const WillPopScope({
    Key key,
    @required this.child,
    @required this.onWillPop,
  })

  onWillPop是一个回调函数，当用户点击返回按钮时被调用（包括导航返回按钮及Android物理返回按钮）。
  该回调需要返回一个Future对象，如果返回的Future最终值为false时，则当前路由不出栈(不会返回)；
  最终值为true时，当前路由出栈退出。我们需要提供这个回调来决定是否退出。
  
*/

class WillPopScopePage extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() {
    return new WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopePage> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WillPopScope'),),
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续按两次返回键退出",style: TextStyle(fontSize: 22.0),),
        )
    )
    );
  }
}