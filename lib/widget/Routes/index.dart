import 'package:flutter/material.dart';


class RoutePage extends StatelessWidget {
  //这是整个应用的主组件
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RoutePageBox(),
      title: 'MaterialApp示例',
      //路由配置
      routes: {
        '/Page1': (BuildContext context) => Page1(), //添加路由
        '/Page2': (BuildContext context) => Page2(),
      },
      // initialRoute: '/Page1',//初始路由页面
    );
  }
}

class RoutePageBox extends StatefulWidget {
  RoutePageBox({Key key}) : super(key: key);

  @override
  _RoutesPageState createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutePageBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('路由用法'),),
      body: Column(children: <Widget>[
        RaisedButton(
          child: Text('跳到Page1',style: TextStyle(fontSize: 22.0)),
          onPressed: (){
            //push--跳转路由
            // Navigator.push(context,MaterialPageRoute(builder: (context) => Page1()));
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page1()));
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page1('你好')));


            //pushName --跳转
            // Navigator.of(context).pushNamed("/Page1",);

            //传参跳转
            Navigator.of(context).pushNamed("/Page1", arguments: "pushNamed传参");
          },
        ),

      ],),
    );
  }
}

Widget args = Builder(builder: (BuildContext context) {
  return Text('路由参数：${ModalRoute.of(context).settings.arguments}');
});

//Page1
class Page1 extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我是Page1'),),
      body: Column(children: <Widget>[
        args,
        RaisedButton(
          child: Text('跳到Page2 --push',style: TextStyle(fontSize: 22.0)),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2()));
          },
        ),
        h10,
        RaisedButton(
          child: Text('跳到Page2--pushReplacement',style: TextStyle(fontSize: 22.0)),
          onPressed: (){
            //pushReplacement--替换路由
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Page2()));
          },
        ),
        h10,
        RaisedButton(
          child: Text('pop--关闭当前路由并返回上一页',style: TextStyle(fontSize: 22.0)),
          onPressed: (){
            Navigator.of(context).pop();
            // Navigator.of(context).pop('pop 传参');
          },
        ),
      ],),
    );
  }
}

//Page2
class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我是Page2'),),
      body: Column(children: <Widget>[
        RaisedButton(
          child: Text('pop',style: TextStyle(fontSize: 22.0)),
          onPressed: (){
            Navigator.of(context).pop('pop 传参');
          },
        ),
        RaisedButton(
          child: Text('跳到跟路由',style: TextStyle(fontSize: 22.0)),
          onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RoutePage()),(route) => route == null,);
          },
        ),
      ],),
    );
  }
}

Widget h10 = SizedBox(height: 10.0,);