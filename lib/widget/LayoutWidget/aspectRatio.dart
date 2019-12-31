import "package:flutter/material.dart";
import "package:flutter1/main.dart";

class AspectRatioPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: MyHomePage(),
      // routes: myRoutes
    );
    /* return Scaffold(
      appBar: AppBar(title: Text('AspectRatio'),),
      body: Column(
        children: <Widget>[
          Text('2')
        ],
      ),
      
    ); */
  }
}

class MyHomePage extends StatefulWidget {

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends  State<MyHomePage> {
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio'),
        leading: IconButton( //左边的 Widget。通常放返回键，或者 Drawer 开关
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.pop(context);
            
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
            /* Navigator.pushAndRemoveUntil(
              context,
              new PageRouteBuilder(
                pageBuilder: (BuildContext context, _, __) {
                  // return HomeScreen();
                }, 
              ),
              (Route<dynamic> r) => false
            ) */
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip
        ),
      ),
      body: Column(
        children: <Widget>[
          Text('2')
        ],
      ),
      
    );
  }
}