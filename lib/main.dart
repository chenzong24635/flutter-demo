import 'package:flutter/material.dart';
// 此行代码作用是导入了Material UI组件库。
//Material是一种标准的移动端和web端的视觉设计语言， Flutter默认提供了一套丰富的Material风格的UI组件。


import 'package:flutter/rendering.dart';

import 'package:flutter1/widget/ScaffoldWidget/Scaffold.dart';
import 'package:flutter1/widget/BasicWidget/index.dart';
import 'package:flutter1/widget/LayoutWidget/index.dart';
import 'package:flutter1/widget/ScrollWidget/index.dart';
import 'package:flutter1/widget/AlertWidget/Alert.dart';
import 'package:flutter1/widget/Cases/index.dart';
import 'package:flutter1/widget/IOSWidget/index.dart';
import 'package:flutter1/widget/AnimationWidget/index.dart';

import 'package:flutter1/widget/Packages/index.dart';
import 'package:flutter1/widget/Routes/index.dart';
import 'package:flutter1/provider/index.dart';
import 'package:flutter1/demo.dart';

// https://api.flutter.dev/flutter/material/MaterialApp-class.html

final List<String> myRoutesName = <String>[
  'Scaffold',
  '基础/其他组件',
  '布局/容器组件',
  '滚动组件',
  '弹窗组件',
  'IOS风格',
  '过渡/动画/交互等',
  '常用例子',
  '第三方包',
  '路由使用',
  'Provider',
  'DemoPage',
];
Map<String, WidgetBuilder> myRoutes = {
  "/Scaffold": (context) => ScaffoldPage(),
  "/BasicWidget": (context) => BasicWidget(),
  "/LayoutWidget": (context) => LayoutWidget(),
  "/ScrollWidget": (context) => ScrollWidget(),
  "/Alert": (context) => AlertPage(),
  "/IOSWidget": (context) => IOSWidget(),
  "/AnimationWidget": (context) => AnimationWidget(),
  "/CasesWidget": (context) => CasesWidget(),
  "/PackagesPage": (context) => PackagesPage(),
  "/RoutePage": (context) => RoutePage(),
  "/ProviderPage": (context) => ProviderPage(),
  "/DemoPage": (context) => DemoPage(),
};

void main() { // main函数为应用程序的入口
  // debugPaintSizeEnabled = true; // 开启可视方式调试布局
  runApp(MyApp()); //runApp启动Flutter应用
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      // title: 'demo',
      home: MyHomePage(),
      // initialRoute: '/Scaffold', //初始路由
      routes: myRoutes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData( //所有页面主题配置(会被Scaffold的appBar的样式覆盖)
        //应用程序整体主题的亮度
        brightness: Brightness.light,
        //App主要部分的背景色
        primaryColor: Colors.blue[600],
        //前景色（文本、按钮等）
        accentColor: Colors.orange[600],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends  State<MyHomePage> {
  var routeLists = myRoutes.keys.toList();
  String msg = 'demo';
  int count = 0;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(msg + count.toString()),
        backgroundColor: Colors.blue,
        toolbarOpacity: .8,
        bottomOpacity: .6,
      ),
      backgroundColor: Colors.grey[300],
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //每行三列
            childAspectRatio: 1.0 //显示区域宽高相等
          ),
          itemCount: myRoutesName.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(myRoutesName[index],style:TextStyle(fontSize: 18.0)),
                  ),
                )
              ),
            );
          },
        ),
      ),
    );
  }
}

/*  
  const MaterialApp({
    Key key,
    this.navigatorKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{}, //路由
    this.initialRoute, //初始路由
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme, //主题样式
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true, //显示右上角debug图标
  }) 
*/