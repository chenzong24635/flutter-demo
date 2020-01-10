import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//https://api.flutter.dev/flutter/cupertino/CupertinoActionSheet-class.html

class CupertinoActionSheetPage extends StatelessWidget {
  const CupertinoActionSheetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('底部弹窗栏-IOS风格',style: TextStyle(fontSize: 18),),
        onPressed: (){
          _handleClickMe(context).then((val) {
            print('点击了${val}');
          });
        },
      ),
    );
  }
}

Future _handleClickMe(context) async {
  return showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        title: Text('Favorite Dessert'),
        message: Text('Please select the best dessert from the options below.'),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text('Profiteroles'),
            onPressed: () { /** */ },
          ),
          CupertinoActionSheetAction(
            child: Text('Cannolis'),
            onPressed: () { /** */ },
          ),
          CupertinoActionSheetAction(
            child: Text('Trifie'),
            onPressed: () { /** */ },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop('取消');
          },
        ),
      );
    },
  );
}