import 'package:flutter/material.dart';

//[SimpleDialog](https://api.flutter.dev/flutter/material/SimpleDialog-class.html)
//[]()
/*
作用：

继承：
Object Diagnosticable DiagnosticableTree Widget StatelessWidget SimpleDialog

构造函数：（类型 属性 = 默认值）
Future<T> showDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true, //点击对话框barrier(遮罩)时是否关闭它
  Widget child,
  WidgetBuilder builder,
  bool useRootNavigator = true,
})
*/


class SimpleDialogPage extends StatefulWidget {
  SimpleDialogPage({Key key}) : super(key: key);

  @override
  _SimpleDialogPageState createState() => _SimpleDialogPageState();
}

class _SimpleDialogPageState extends State<SimpleDialogPage> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _showDialog(context);
      },
      child: Text(
        'SimpleDialog',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

_showDialog(BuildContext context) {
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
