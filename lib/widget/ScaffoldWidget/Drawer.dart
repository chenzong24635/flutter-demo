import 'package:flutter/material.dart';
import './BottomNavigationBar.dart';
import './BottomNavigationBar1.dart';

//[Drawer](https://api.flutter.dev/flutter/material/Drawer-class.html)
/*
作用：

继承： Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > Drawer

构造函数：（类型 属性 = 默认值）
const Drawer({
  Key key,
  this.elevation = 16.0,
  this.child,
  this.semanticLabel,
}) 
*/

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return drawer1;
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,//移除抽屉菜单顶部默认留白
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CircleAvatar(
                      radius: 36.0,
                      backgroundImage: AssetImage("images/a.jpg"),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('A'),
                    onTap: (){
                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>BottomNavigationBarPage()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('B'),
                    onTap: (){
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget drawer1 = Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: const <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text(
          'Drawer Header',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.message),
        title: Text('Messages'),
      ),
      ListTile(
        leading: Icon(Icons.account_circle),
        title: Text('Profile'),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
      ),
    ],
  ),
);