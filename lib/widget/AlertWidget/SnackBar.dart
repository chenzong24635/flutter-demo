import 'package:flutter/material.dart';

//[SnackBar](https://api.flutter.dev/flutter/material/SnackBar-class.html)
/*
作用：SnackBar 是用户操作后，在屏幕的底部显示提示信息的一个控件，类似Toast，会自动隐藏。同一时间只能显示一条SnackBar
SnackBar是通过Scaffold的showSnackBar方法来显示的。
所以要显示一个SnackBar,要先拿到Scaffold

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatefulWidget > SnackBar

构造函数：（类型 属性 = 默认值）

const SnackBar({
  Key key,
  @required this.content, //内容
  this.backgroundColor,
  this.elevation,
  this.shape,
  this.behavior,
  this.action, //操作按钮
  this.duration,
  this.animation,
  this.onVisible,
})  
*/

class ShowSnackBar extends StatelessWidget {
  const ShowSnackBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _showSnackBar;
  }
}

Widget _showSnackBar = 
  //当BuildContext在Scaffold之前时，调用Scaffold.of(context)会报错。需要通过Builder Widget来解决
  Builder(builder: (BuildContext context) {
    return RaisedButton(
      onPressed: () {
        //创建一个SnackBar,再通过Scaffold的方法来显示。
        final snackBar = SnackBar(
          content: Text('这是一个SnackBar',style: TextStyle(fontSize: 18),),
          action: new SnackBarAction( // 给SnackBar添加一个操作按钮
            label: '撤消',
            onPressed: () {
                // do something to undo
            }
          ),
          duration: Duration(seconds: 1)
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Text('SnackBar',style: TextStyle(fontSize: 18),),
    );
  });

