https://book.flutterchina.club/chapter9/


# 动画通知

通过Animation来监听动画每一帧以及执行状态的变化，Animation有如下两个方法：

* addListener()；它可以用于给Animation添加帧监听器，在每一帧都会被调用。帧监听器中最常见的行为是改变状态后调用setState()来触发UI重建。
* addStatusListener()；它可以给Animation添加“动画状态改变”监听器；动画开始、结束、正向或反向（见AnimationStatus定义）时会调用状态改变的监听器。

# Curve 动画曲线

常用曲线：
|Curves曲线	|动画过程|
|:--|:--|
|linear	|匀速的
|decelerate	|匀减速
|ease	|开始加速，后面减速
|easeIn	|开始慢，后面快
|easeOut	|开始快，后面慢
|easeInOut	|开始慢，然后加速，最后再减速

通过CurvedAnimation来指定动画的曲线
```dart
CurvedAnimation({
  @required this.parent,
  @required this.curve,
  this.reverseCurve,
})

final CurvedAnimation curve = CurvedAnimation(
  parent: controller,
  curve: Curves.easeIn
);
```

AnimationController用于控制动画，它包含
* 动画启动forward()、
* 动画停止stop() 、
* 动画反向播放 reverse()

AnimationController会在动画的每一帧，就会生成一个新的值。默认情况下，AnimationController在给定的时间段内线性的生成从0.0到1.0（默认区间）的数字。 
```dart
AnimationController({
  double value,
  this.duration,
  this.reverseDuration,
  this.debugLabel,
  this.lowerBound = 0.0,
  this.upperBound = 1.0,
  this.animationBehavior = AnimationBehavior.normal,
  @required TickerProvider vsync,
})

final AnimationController controller = new AnimationController(
 duration: Duration(milliseconds: 2000),
 lowerBound: 10.0,
 upperBound: 20.0,
 vsync: this
);
```

# Tween
默认情况下，AnimationController对象值的范围是[0.0，1.0]。
如果我们需要构建UI的动画值在不同的范围或不同的数据类型，则可以使用Tween来添加映射以生成不同的范围或数据类型的值

Tween构造函数需要begin和end两个参数,
要使用Tween对象，需要调用其animate()方法，然后传入一个控制器对象。
```dart
final AnimationController _controller = AnimationController(
  duration: Duration(seconds: 3),
  vsync: this,
);

Animation<double> _animation =
  Tween(begin: 1.0, end: 0.0)
  .animate(_controller..forward())
  ..addListener(() {
    setState(()=>{});
  });
```

# addStatusListener()动画状态监听
|枚举值	|含义
|:--|:--
|dismissed	|动画在起始点停止
|forward	|动画正在正向执行
|reverse	|动画正在反向执行
|completed	|动画在终点停止