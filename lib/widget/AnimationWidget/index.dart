import 'package:flutter/material.dart';

import 'package:flutter1/main.dart';

import './GestureDetector.dart';
import './Listener.dart';
import './Dismissible.dart';
import './Draggable.dart';
import './Hero.dart';

import './Transition/DecoratedBoxTransition.dart';
import './Transition/FadeTransition.dart';
import './Transition/PositionedTransition.dart';
import './Transition/RelativePositionedTransition.dart';
import './Transition/AlignTransition.dart';
import './Transition/SlideTransition.dart';
import './Transition/RotationTransition.dart';
import './Transition/ScaleTransition.dart';
import './Transition/SizeTransition.dart';

import './Animated/AnimatedContainer.dart';
import './Animated/AnimatedDefaultTextStyle.dart';
import './Animated/AnimatedBuilder.dart';
import './Animated/AnimatedCrossFade.dart';
import './Animated/AnimatedOpacity.dart';

import './Animated/AnimatedSwitcher.dart';

import './Animated/AnimatedPhysicalModel.dart';
import './Animated/AnimatedModalBarrier.dart';
import './Animated/AnimatedListState.dart';
import './Animated/AnimatedPositioned.dart';


final List<String> myRoutesName = <String>[
  'GestureDetector',
  'Listener',
  'Dismissible',
  'Draggable',
  'Hero',
  'DecoratedBoxTransition',
  'FadeTransition',
  'PositionedTransition',
  'SlideTransition',
  'RotationTransition',
  'ScaleTransition',
  'SizeTransition',
  'AnimatedContainer',
  'AnimatedDefaultTextStylePage',
  'AnimatedBuilder',
  'AnimatedCrossFade',
  'AnimatedOpacity',
  'AnimatedSwitcher',
];
Map<String, WidgetBuilder> myRoutes = {
  "/GestureDetectorPage": (context) => GestureDetectorPage(),
  "/ListenerPage": (context) => ListenerPage(),
  "/DismissiblePage": (context) => DismissiblePage(),
  "/DraggablePage": (context) => DraggablePage(),
  "/HeroPage": (context) => HeroPage(),
  '/DecoratedBoxTransitionPage': (context) => DecoratedBoxTransitionPage(),
  '/FadeTransitionPage': (context) => FadeTransitionPage(),
  '/PositionedTransitionPage': (context) => PositionedTransitionPage(),
  '/SlideTransitionPage': (context) => SlideTransitionPage(),
  '/RotationTransitionPage': (context) => RotationTransitionPage(),
  '/ScaleTransitionPage': (context) => ScaleTransitionPage(),
  '/SizeTransitionPage': (context) => SizeTransitionPage(),
  "/AnimatedContainerPage": (context) => AnimatedContainerPage(),
  "/AnimatedDefaultTextStylePage": (context) => AnimatedDefaultTextStylePage(),
  '/AnimatedBuilderPage': (context) => AnimatedBuilderPage(),
  '/AnimatedCrossFadePage': (context) => AnimatedCrossFadePage(),
  '/AnimatedOpacityPage': (context) => AnimatedOpacityPage(),
  '/AnimatedSwitcherPage': (context) => AnimatedSwitcherPage(),
  
};

// void main() => runApp(MyApp());

class AnimationWidget extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyHomePage(),
      routes: myRoutes
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends  State<MyHomePage> {
  var routeLists = myRoutes.keys.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画，交互'),
        leading: IconButton( //左边的 Widget。通常放返回键，或者 Drawer 开关
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
          },
        ),
      ),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (context, index) {
            return new InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: new Card(
                child: new Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(15.0),
                  child: new Text(myRoutesName[index],style:TextStyle(fontSize: 18.0)),
                ),
              ),
            );
          },
          itemCount: myRoutesName.length,
        ),
      ),
    );
  }
}