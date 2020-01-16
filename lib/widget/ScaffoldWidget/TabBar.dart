//[](https://api.flutter.dev/flutter/material/TabBar-class.html)
/*
作用：tab栏

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget TabBar

构造函数：（类型 属性 = 默认值）

  const TabBar({
    Key key,
    @required this.tabs,
    this.controller, //Tab页的控制器，用于定义Tab标签和内容页的坐标，还可配置标签页的切换动画效果等
    this.isScrollable = false, //是否滚动
    this.indicatorColor, //所选标签 下划线颜色
    this.indicatorWeight = 2.0, //所选标签 下划线粗细
    this.indicatorPadding = EdgeInsets.zero, // 所选标签下方的padding
    this.indicator, // 所选标签指示符的外观
    this.indicatorSize, //所选标签指示符的大小
    this.labelColor, //标签颜色
    this.labelStyle, 
    this.labelPadding, //标签的padding
    this.unselectedLabelColor,//未选中的 标签颜色
    this.unselectedLabelStyle,
    this.dragStartBehavior = DragStartBehavior.start,
    this.onTap,
  })
*/