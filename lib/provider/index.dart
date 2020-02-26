//https://juejin.im/post/5d00a84fe51d455a2f22023f
//https://www.jianshu.com/p/f220136c05d4
//[provider](https://pub.flutter-io.cn/packages/provider)

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './counter.dart';

//因为Provider是InheritedWidget的语法糖，数据传递的方向是父Widget和子Widget之间，
//我们需要在main.dart 将Provider作为FirstPage和SecondPage的父Widget
class ProviderPage extends StatefulWidget {
  ProviderPage({Key key}) : super(key: key);

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Provider'),),
      body: FirstScreen(),
    );
  }
}
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    final textSize = Provider.of<int>(context).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, CounterModel counter, _) {
            return Text(
              'Value: ${_counter.value}',
              style: TextStyle(fontSize: textSize),
            );
          }
        )
      ),
      /* body: Center(
        child: Text(
          'Value: ${_counter.value}',
          style: TextStyle(fontSize: textSize),
        ),
      ), */
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondPage())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Consumer2<CounterModel,int>(
        builder: (context, CounterModel counter, int textSize, _) => Center(
              child: Text(
                'Value: ${counter.value}',
                style: TextStyle(
                  fontSize: textSize.toDouble(),
                ),
              ),
            ),
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) => FloatingActionButton(
              onPressed: counter.increment,
              child: child,
            ),
        child: Icon(Icons.add),
      ),
    );
  }
}
