import 'package:flutter/material.dart';

class AlertDialogPage2 extends StatefulWidget {
  AlertDialogPage2({Key key}) : super(key: key);

  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage2> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _showDialog(context).then((val) {
          print('点击了$val');
        });
      },
      child: Text(
        'StatefulBuilder--对话框状态管理',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

_showDialog(BuildContext context) {
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