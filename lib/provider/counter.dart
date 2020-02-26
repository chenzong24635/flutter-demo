import 'package:flutter/material.dart';

//使用mixin混入了ChangeNotifier，这个类可以帮助资源类管理所有资源类的听众，
//我们可以通过调用notifyListeners，来通知所有听众进行UI刷新。
class CounterModel with ChangeNotifier {
  int _count = 0;
  int get value => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
