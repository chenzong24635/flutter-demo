import 'package:flutter/material.dart';

//[BottomSheet](https://api.flutter.dev/flutter/material/BottomSheet-class.html)

class ShowModalBottomSheetPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _showModalBottomSheet(context);
      },
      child: Text(
        '底部弹窗 showModalBottomSheet',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
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