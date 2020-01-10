import 'package:flutter/material.dart';

class AlertDialogLoadingPage extends StatefulWidget {
  AlertDialogLoadingPage({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<AlertDialogLoadingPage> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        // _showLoadingDialog(context);
        _showLoadingDialog1(context);
      },
      child: Text(
        'AlertDialog-Loading',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

_showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    // barrierDismissible: false, //点击遮罩不关闭对话框
    builder: (context) {
      return AlertDialog(
        backgroundColor: Color(0x88000000),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
            // CircularProgressIndicator(value: .8,),
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Text("正在加载，请稍后...",style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    },
  );
}

//自定义对话框宽度
_showLoadingDialog1(BuildContext context) {
  showDialog(
    context: context,
    // barrierDismissible: false, //点击遮罩不关闭对话框
    builder: (context) {
      return UnconstrainedBox(
        constrainedAxis: Axis.vertical,
        child: SizedBox(
          width: 280,
          child: AlertDialog(
            backgroundColor: Color(0x88000000),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
                // CircularProgressIndicator(value: .8,),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: Text("自定义对话框宽度-正在加载，请稍后...",style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}