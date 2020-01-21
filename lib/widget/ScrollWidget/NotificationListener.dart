import 'package:flutter/material.dart';

//[](https://api.flutter.dev/flutter/widgets/NotificationListener-class.html)
/*
作用：用于监听气泡冒泡的通知,称为通知冒泡
每一个节点都可以分发通知，通知会沿着当前节点向上传递，所有父节点都可以通过NotificationListener来监听通知。
通知冒泡和用户触摸事件冒泡是相似的，但有一点不同：通知冒泡可以中止（return false;），但用户触摸事件不行。

继承：Object Diagnosticable DiagnosticableTree Widget StatelessWidget NotificationListener

构造函数：（类型 属性 = 默认值）
  const NotificationListener({
    Key key,
    @required this.child,
    this.onNotification,
  }) 
*/


class NotificationListenerPage extends StatefulWidget {
  NotificationListenerPage({Key key}) : super(key: key);

  @override
  _NotificationListenerPageState createState() => _NotificationListenerPageState();
}

class TestNotification extends Notification {
  TestNotification({@required this.count,});

  final int count;
}
class _NotificationListenerPageState extends State<NotificationListenerPage> {
  //是否显示返回最顶按钮
  bool toTop = false;

  //当前滚动的位置
  double offset = 0;

  //当前滚动位置/距离底部 百分比
  String percent = '0%';

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener((){
    	  //监听当前滚动的位置
        /* setState(() {
          offset = _scrollController.offset;
        }); */

        if(_scrollController.offset<1000 && toTop){
          //滚到1000时隐藏 返回顶部按钮
          setState(() {
            toTop = false;
          });
        }else if(_scrollController.offset>=1000 && toTop == false){
          //滚到1000时显示 返回顶部按钮
          setState(() {
            toTop = true;
          });
        }
      }
    );
  }


  //为了避免内存泄露，需要调用_controller.dispose
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationListener --滚动监听'),
      ),
      //返回顶部按钮
      floatingActionButton: !toTop ? null : FloatingActionButton(
        onPressed: (){
          //返回到顶部时执行动画
          _scrollController.animateTo(
              0,
              duration: Duration(seconds: 2),
              curve: Curves.ease);
        },
        child: Icon(Icons.arrow_upward),
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
          onPressed: () {
            _scrollController.animateTo(0,
                duration: Duration(seconds: 1), curve: Curves.bounceInOut);
          },
          child: new Text("position: ${offset.floor()}"),
        ),
      ],
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification){
          ScrollMetrics metrics = notification.metrics;

          print('滚动情况：${notification.runtimeType}');

          double progress = metrics.pixels / metrics.maxScrollExtent;
          setState(() {
            //阻止冒泡
            /* if(_scrollController.offset>=1000){
              return false; 
            } */
            offset = metrics.pixels;
            percent = "${(progress*100).toInt()}%";
          });

          print(metrics.pixels);// 当前位置
          print(metrics.atEdge);//是否在顶部或底部
          print(metrics.axis);//垂直或水平滚动
          print(metrics.axisDirection);// 滚动方向是down还是up
          print(metrics.extentAfter);//视口底部距离列表底部有多大
          print(metrics.extentBefore);//视口顶部距离列表顶部有多大
          print(metrics.extentInside);//视口范围内的列表长度
          print(metrics.maxScrollExtent);//最大滚动距离，列表长度-视口长度
          print(metrics.minScrollExtent);//最小滚动距离
          print(metrics.viewportDimension);//视口长度
          print(metrics.outOfRange);//是否越过边界
          print('------------------------');
          return true;
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              controller: _scrollController,
              itemExtent: 50,
              itemCount: 50,
              itemBuilder: (BuildContext context,int index){
                return ListTile(title: Text(index.toString()),);
              },
            ),
            CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 30,
              child: Text(percent, style:TextStyle(color: Colors.blue))
            )
          ],
        )
      ),
    );
  }
}