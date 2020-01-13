import 'package:flutter/material.dart';

//[](https://api.flutter.dev/flutter/material/Stepper-class.html)
/*
作用：步骤

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget Stepper

构造函数：（类型 属性 = 默认值）

*/

class StepperPage extends StatefulWidget {
  StepperPage({Key key}) : super(key: key);

  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stepper'),),
      body: Stepper(
    currentStep: _currentStep,
    onStepContinue: () {
      if (_currentStep >= 4) return;
      setState(() {
        _currentStep += 1;
      });
    },
    onStepCancel: () {
      if (_currentStep <= 0) return;
      setState(() {
        _currentStep -= 1;
      });
    },
    steps: const <Step>[
      Step(
        title: Text('Step 1'),
        content: SizedBox(
          width: 100.0,
          height: 100.0,
        ),
      ),
      Step(
        title: Text('Step 2'),
        content: SizedBox(
          width: 100.0,
          height: 100.0,
        ),
      ),
      Step(
        title: Text('Step 3'),
        content: SizedBox(
          width: 100.0,
          height: 100.0,
        ),
      ),
      Step(
        title: Text('Step 4'),
        content: SizedBox(
          width: 100.0,
          height: 100.0,
        ),
      ),
      Step(
        title: Text('Step 5'),
        content: SizedBox(
          width: 100.0,
          height: 100.0,
        ),
      ),
    ],
  ),
    );
  }
}