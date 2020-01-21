import 'package:flutter/material.dart';

class ThemePage extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => new _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemePage> {
  Color _themeColor = Colors.teal; //当前路由主题色

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
          iconTheme: IconThemeData(color: _themeColor) //用于Icon颜色
      ),
      child: Scaffold(
        appBar: AppBar(title: Text("主题测试")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //第一行Icon使用主题中的iconTheme
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("  颜色跟随主题")
                ]
            ),
            //为第二行Icon自定义颜色（固定为黑色)
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                    color: Colors.black
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("  颜色固定黑色")
                  ]
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>  //切换主题
                setState(() =>
                _themeColor =
                _themeColor == Colors.teal ? Colors.blue : Colors.teal
                ),
            child: Icon(Icons.palette)
        ),
      ),
    );
  }
}


//https://api.flutter.dev/flutter/material/ThemeData-class.html
/*
作用：主题样式
可以通过局部主题覆盖全局主题

继承：Object Diagnosticable ThemeData

构造函数：（类型 属性 = 默认值）
  const Theme({
    Key key,
    @required this.data,
    this.isMaterialAppTheme = false,
    @required this.child,
  })

  factory ThemeData({
    Brightness brightness, //深色还是浅色
    MaterialColor primarySwatch, //主题颜色样本
    Color primaryColor, //主色，决定导航栏颜色
    Brightness primaryColorBrightness,
    Color primaryColorLight,
    Color primaryColorDark,
    Color accentColor, //次级色，决定大多数Widget的颜色，如进度条、开关等。
    Brightness accentColorBrightness,
    Color canvasColor,
    Color scaffoldBackgroundColor,
    Color bottomAppBarColor,
    Color cardColor, //卡片颜色
    Color dividerColor, //分割线颜色
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    InteractiveInkFeatureFactory splashFactory,
    Color selectedRowColor,
    Color unselectedWidgetColor,
    Color disabledColor,
    Color buttonColor,
    ButtonThemeData buttonTheme, //按钮主题
    ToggleButtonsThemeData toggleButtonsTheme,
    Color secondaryHeaderColor,
    Color textSelectionColor,
    Color cursorColor, //输入框光标颜色
    Color textSelectionHandleColor,
    Color backgroundColor,
    Color dialogBackgroundColor, //对话框背景颜色
    Color indicatorColor,
    Color hintColor,
    Color errorColor,
    Color toggleableActiveColor,
    String fontFamily, //文字字体
    TextTheme textTheme, // 字体主题，包括标题、body等文字样式
    TextTheme primaryTextTheme,
    TextTheme accentTextTheme,
    InputDecorationTheme inputDecorationTheme,
    IconThemeData iconTheme, // Icon的默认样式
    IconThemeData primaryIconTheme,
    IconThemeData accentIconTheme,
    SliderThemeData sliderTheme,
    TabBarTheme tabBarTheme,
    TooltipThemeData tooltipTheme,
    CardTheme cardTheme,
    ChipThemeData chipTheme,
    TargetPlatform platform, //指定平台，应用特定平台控件风格
    MaterialTapTargetSize materialTapTargetSize,
    bool applyElevationOverlayColor,
    PageTransitionsTheme pageTransitionsTheme,
    AppBarTheme appBarTheme,
    BottomAppBarTheme bottomAppBarTheme,
    ColorScheme colorScheme,
    DialogTheme dialogTheme,
    FloatingActionButtonThemeData floatingActionButtonTheme,
    Typography typography,
    CupertinoThemeData cupertinoOverrideTheme,
    SnackBarThemeData snackBarTheme,
    BottomSheetThemeData bottomSheetTheme,
    PopupMenuThemeData popupMenuTheme,
    MaterialBannerThemeData bannerTheme,
    DividerThemeData dividerTheme,
    ButtonBarThemeData buttonBarTheme,
  })
*/