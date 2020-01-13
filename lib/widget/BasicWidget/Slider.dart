import "package:flutter/material.dart";

import '../IOSWidget/CupertinoSlider.dart';

//[Slider](https://api.flutter.dev/flutter/material/Slider-class.html)
/*
作用：滑动条

继承：Object > Diagnosticable > DiagnosticableTree > Widget > StatefulWidget > Slider

构造函数：（类型 属性 = 默认值）
const Slider({
  Key key,
  @required this.value, //控件的位置
  @required this.onChanged, // 变化时回调
  this.onChangeStart, // 滑动开始时回调
  this.onChangeEnd, // 滑动结束时回调
  this.min = 0.0, // 最小值
  this.max = 1.0, // 最大值
  this.divisions, // 将滑动条几等分，每次滑动只能移动一份
  this.label, // 配合divisions属性 显示在节点上的label
  this.activeColor, // 滑动过的区域的颜色
  this.inactiveColor, // 未 滑动过的区域的颜色
  this.semanticFormatterCallback, // 根据滑块值创建语义值的回调
}) 
*/

class SliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider RangeSlider'),
        ),
        body: SliderBox());
  }
}

class SliderBox extends StatefulWidget {
  @override
  _SliderBoxState createState() => new _SliderBoxState();
}

class _SliderBoxState extends State<SliderBox> {
  double _value = 0;
  int _dollars = 20;

  double _starValue = 12.0;
  double _endValue  = 50.0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(height: 120.0),
            Slider(
              value: _value,
              onChanged: (newValue) {
                print('onChanged:$newValue');
                setState(() {
                  _value = newValue;
                });
              },
              onChangeStart: (startValue) {
                print('onChangeStart:$startValue');
              },
              onChangeEnd: (endValue) {
                print('onChangeEnd:$endValue');
              },
              label: '$_value dollars',
              divisions: 5,
              semanticFormatterCallback: (newValue) {
                return '${newValue.round()} dollars';
              },
            ),
            Slider(
              value: _dollars.toDouble(),
              min: 20.0,
              max: 330.0,
              label: '$_dollars dollars',
              onChanged: (double newValue) {
                setState(() {
                  _dollars = newValue.round();
                });
              },
              semanticFormatterCallback: (double newValue) {
                return '${newValue.round()} dollars';
              }
            ),
            SizedBox(height: 20.0,),
            Text('RangeSlider'),
            RangeSlider(
              values: RangeValues(_starValue, _endValue),
              min: 0.0,
              max: 100.0,
              onChanged: (val){
                setState(() {
                  _starValue = val.start.roundToDouble();
                  _endValue = val.end.roundToDouble();
                });
              },
            ),
            SizedBox(height: 20.0,),
            Text('IOS风格'),
            CupertinoSliderPage(),
          ],
        )
      ],
    );
  }
}
