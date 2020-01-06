import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';

//[对话框详解](https://book.flutterchina.club/chapter7/dailog.html)

//[Dialog](https://api.flutter.dev/flutter/material/Dialog-class.html)
//[showDialog](https://api.flutter.dev/flutter/material/showDialog-class.html)
//[SimpleDialog](https://api.flutter.dev/flutter/material/SimpleDialog-class.html)
//[AlertDialog](https://api.flutter.dev/flutter/material/AlertDialog-class.html)

// AlertDialog和SimpleDialog都使用了Dialog类

/*
作用：

继承：

构造函数：（类型 属性 = 默认值）
const AlertDialog({
  Key key,
  this.title, //对话框标题组件
  this.titlePadding, // 标题填充
  this.titleTextStyle, //标题文本样式
  this.content, // 对话框内容组件
  this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0), //内容的填充
  this.contentTextStyle,// 内容文本样式
  this.actions, // 对话框操作按钮组
  this.backgroundColor, // 对话框背景色
  this.elevation,// 对话框的阴影
  this.semanticLabel, //对话框语义化标签(用于读屏软件)
  this.shape, // 对话框外形
})
*/

class AlertPage extends StatefulWidget {
  AlertPage({Key key}) : super(key: key);

  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('弹窗'),
      ),
      body: Wrap(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  _showSimpleDialog(context);
                },
                child: Text(
                  'SimpleDialog',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _showDialog(context);
                },
                child: Text(
                  'Material风格的AlertDialog',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  //Dialog 点击按钮返回值
                  _showIOSDialog(context).then((value) {
                    print("对话框消失:$value");
                  });
                },
                child: Text(
                  'IOS风格的AlertDialog',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _showModalBottomSheet(context);
                },
                child: Text(
                  '底部Modal',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _showMyDialogWithColumn(context).then((val) {
                    print('${val}');
                  });
                },
                child: Text(
                  '列表项对话框',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _showMyDialogWithStateBuilder(context);
                },
                child: Text(
                  'StatefulWidget',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _showLoadingDialog(context);
                },
                child: Text(
                  'Loading',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _showDatePicker1(context);
                },
                child: Text(
                  '_showDatePicker1',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _showMyCustomLoadingDialog(context);
                },
                child: Text(
                  '自定义',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
            ],
          )],
      ),
    );
  }

  _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('SimpleDialog'),
          titlePadding: EdgeInsets.all(20.0),
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0), // 内容padding
          backgroundColor: Colors.white,
          elevation: 11.0,//悬浮高度，和阴影效果有关
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))), // 边框形状
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text("A"),
              onPressed: () {
                Navigator.of(context).pop("A");
              },
            ),
            new SimpleDialogOption(
              child: new Text("B"),
              onPressed: () {
                Navigator.of(context).pop("B");
              },
            ),
            new SimpleDialogOption(
              child: new Text("C"),
              onPressed: () {
                Navigator.of(context).pop("C");
              },
            ),
          ],
        );
      }
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('提示'),
        content: Text('这是一个Dialog！'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('取消')
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('确定')
          )
        ],
      )
    );
  }

  _showIOSDialog(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return new CupertinoAlertDialog(
          title: new Text("title"),
          content: new Text("内容内容内容内容内容内容内容内容内容内容内容"),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pop("点击了确定");
              },
              child: new Text("确认"),
            ),
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pop("点击了取消");
              },
              child: new Text("取消"),
            ),
          ],
        );
      }
    );
  }

  Future _showMyDialogWithColumn(BuildContext context) {
    var index = -1;
    return showDialog(
      context: context,
      builder: (context) {
        return new AlertDialog(
          title: new Text("title"),
          content: Container(
            height: 200,
            child: new SingleChildScrollView(
              child: new Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      index = 1;
                    },
                    child: new SizedBox(
                      child: new Text("1"),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      index = 2;
                    },
                    child: new SizedBox(
                      child: new Text("2"),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      index = 3;
                    },
                    child: new SizedBox(
                      child: new Text("3"),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      index = 4;
                    },
                    child: new SizedBox(
                      child: new Text("4"),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pop(index);
              },
              child: new Text("确认"),
            ),
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pop(-1);
              },
              child: new Text("取消"),
            ),
          ],
        );
      }
    );
  }

  _showModalBottomSheet(BuildContext context){
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(100.0),
          child:Text('我是个底部弹窗')
        );
      }
    );
  }

  void _showMyDialogWithStateBuilder(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        bool selected = false;
        return new AlertDialog(
          title: new Text("StatefulBuilder"),
          content:new StatefulBuilder(builder: (context, StateSetter setState) {
            return Container(
              child: new CheckboxListTile(
                title: new Text("选项"),
                value: selected,
                onChanged: (bool) {
                  setState(() {
                    selected = !selected;
                  });
                }
              ),
            );
          }),
        );
      },
    );
  }

  Future<DateTime> _showDatePicker1(BuildContext context) {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add( //未来30天可选
        Duration(days: 30),
      ),
    );
  }

  _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              // CircularProgressIndicator(value: .8,),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text("正在加载，请稍后..."),
              )
            ],
          ),
        );
      },
    );
  }

  void _showMyCustomLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return new MyCustomLoadingDialog();
      }
    );
  }
}

class MyCustomLoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Duration insetAnimationDuration = const Duration(milliseconds: 100);
    Curve insetAnimationCurve = Curves.decelerate;

    RoundedRectangleBorder _defaultDialogShape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)));

    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: SizedBox(
            width: 120,
            height: 120,
            child: Material(
              elevation: 24.0,
              //dialog背景颜色
              color: Color(0x88000000),
              type: MaterialType.card,
              //在这里修改成我们想要显示的widget就行了，外部的属性跟其他Dialog保持一致
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new CircularProgressIndicator(
                    //圆圈颜色控制
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: new Text(
                      "加载中",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              shape: _defaultDialogShape,
            ),
          ),
        ),
      ),
    );
  }
}
