//https://mp.weixin.qq.com/s/HMztpgOIS65__TEMahL-kg

import 'package:flutter/material.dart';
import '404.dart';

class RoutePage extends StatelessWidget {
  //这是整个应用的主组件
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RoutePageBox(),
      title: 'MaterialApp示例',
      //路由配置
      routes: {
        '/RoutePage': (BuildContext context) => RoutePage(),
        '/Page1': (BuildContext context) => Page1(), //添加路由
        '/Page2': (BuildContext context) => Page2(),
      },
      //未知路由处理
      onUnknownRoute: (RouteSettings setting) {
        return MaterialPageRoute(builder: (context) => UnknownPage());
      }
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
      appBar: AppBar(title: Text('Page0 '),),
      body: Column(children: <Widget>[
        RaisedButton(
          child: Text('跳到Page1',style: TextStyle(fontSize: 22.0)),
          onPressed: (){
            //push--跳转路由
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page1()));
            // Navigator.push(context,MaterialPageRoute(builder: (context) => Page1()));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Page1(txt1: 'push 方法的传参'))
            );

            //pushReplacement --替换路由
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Page1()));
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Page1(txt1: 'pushReplacement 方法的传参')));

            //pushNamed --命名路由 跳转
            // Navigator.of(context).pushNamed("/Page1",); 
            // Navigator.of(context).pushNamed("/Page1", arguments: "pushNamed方法的传参");

            // Navigator.of(context).pushReplacementNamed("/Page1"); //替换路由
          },
        ),
        SizedBox(height: 30,),
        RaisedButton(
          child: Text('不存在的路由'),
          onPressed: (){
            //跳转到一个不存在的路由
            Navigator.of(context).pushNamed("/unknow",); 
          },
        ),
      ],),
    );
  }
}

Widget args = Builder(builder: (BuildContext context) {
  return Text('命名路由参数：${ModalRoute.of(context).settings.arguments}');
});

//Page1
class Page1 extends StatelessWidget {

  final String txt1;//获取路由传参的内容

  final String txt2;//获取路由传参的内容 pop方法

  Page1({Key key, this.txt1, this.txt2}):super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('我是Page1'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Page0传递的参数(命名路由)： $args',style: TextStyle(fontSize: 20.0),),
          SizedBox(height: 30.0,),
          Text('Page0传递的参数： $txt1',style: TextStyle(fontSize: 20.0),),
          SizedBox(height: 30.0,),
          Text('Page2传递的参数： $txt2',style: TextStyle(fontSize: 20.0),),
          SizedBox(height: 100.0,),
          RaisedButton(
            child: Text('跳到Page2',style: TextStyle(fontSize: 22.0)),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => Page2()));
            },
          ),
          SizedBox(height:10.0),
        ],
      ),
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
          child: Text('返回page1',style: TextStyle(fontSize: 22.0)),
          onPressed: (){
            Navigator.pop(context,'Page2的pop传参');
          },
        ),
        RaisedButton(
          child: Text('跳到跟路由 page0',style: TextStyle(fontSize: 22.0)),
          onPressed: (){
            /* Navigator.popUntil(
              context,
              ModalRoute.withName("/RoutePage")
            ); */

            // Navigator.popAndPushNamed(context, '/RoutePage');

            /* Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (context) => RoutePage()),
              (route) => route == null,
            ); */

            /* Navigator.pushNamedAndRemoveUntil(
              context,
              "/RoutePage",
              (route) => false
            ); */

          },
        ),
      ],),
    );
  }
}

