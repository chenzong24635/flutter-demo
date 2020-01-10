import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class DemoPage extends StatefulWidget {
  DemoPage({Key key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('demo')),
      body: RaisedButton(onPressed: (){
        _handleClickMe(context);
      },child: Text('sd'),)
    );
  }
}


Future<void> _handleClickMe(context) async {
  return showCupertinoModalPopup<void>(
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
          onPressed: () { /** */ },
        ),
      );
    },
  );
}