import 'package:flutter/material.dart';

class AlertDialogPage1 extends StatefulWidget {
  AlertDialogPage1({Key key}) : super(key: key);

  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage1> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _changeLanguage(context);
        // _showDialog(context)
        // .then((val) {
        //   print('点击了${val}');
        // });
      },
      child: Text(
        'AlertDialog-列表项对话框',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

Future<void> _changeLanguage(BuildContext context) async {
  int i = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('请选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                // 返回1
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                // 返回2
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('美国英语'),
              ),
            ),
          ],
        );
      });

  if (i != null) {
    print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
  }
}

_showDialog(BuildContext context) {
  int index = -1;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("title"),
        content: Container(
          height: 200,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    index = 1;
                  },
                  child: SizedBox(
                    child: Text("1"),
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
      );
    }
  );
}
