import 'package:flutter/material.dart';

import 'package:flutter1/main.dart';

import './GestureDetector.dart';
import './Listener.dart';
import './WillPopScope.dart';
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

import './Animated/AnimatedWidget.dart';
import './Animated/AnimatedBuilder.dart';
import './Animated/AnimatedContainer.dart';
import './Animated/AnimatedPadding.dart';
import './Animated/AnimatedAlign.dart';
import './Animated/AnimatedPositioned.dart';
import './Animated/AnimatedDefaultTextStyle.dart';
import './Animated/AnimatedCrossFade.dart';
import './Animated/AnimatedOpacity.dart';
import './Animated/AnimatedSwitcher.dart';

// import './Animated/AnimatedSize.dart';
// import './Animated/AnimatedPhysicalModel.dart';
// import './Animated/AnimatedModalBarrier.dart';
// import './Animated/AnimatedListState.dart';
// import './Animated/AnimatedWidgetBaseState.dart';


final List<String> myRoutesName = <String>[
  'GestureDetector',
  'Listener',
  'WillPopScope',
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
  'AnimatedWidget',
  'AnimatedBuilder',
  'AnimatedContainer',
  'AnimatedPadding',
  'AnimatedAlign',
  'AnimatedPositioned',
  'AnimatedDefaultTextStylePage',
  'AnimatedCrossFade',
  'AnimatedOpacity',
  'AnimatedSwitcher',
  // 'AnimatedSize',
];
Map<String, WidgetBuilder> myRoutes = {
  "/GestureDetectorPage": (context) => GestureDetectorPage(),
  "/ListenerPage": (context) => ListenerPage(),
  "/WillPopScopePage": (context) => WillPopScopePage(),
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
  '/AnimatedWidgetPage': (context) => AnimatedWidgetPage(),
  '/AnimatedBuilderPage': (context) => AnimatedBuilderPage(),
  "/AnimatedContainerPage": (context) => AnimatedContainerPage(),
  "/AnimatedPaddingPage": (context) => AnimatedPaddingPage(),
  "/AnimatedAlignPage": (context) => AnimatedAlignPage(),
  "/AnimatedPositionedPage": (context) => AnimatedPositionedPage(),
  "/AnimatedDefaultTextStylePage": (context) => AnimatedDefaultTextStylePage(),
  '/AnimatedCrossFadePage': (context) => AnimatedCrossFadePage(),
  '/AnimatedOpacityPage': (context) => AnimatedOpacityPage(),
  '/AnimatedSwitcherPage': (context) => AnimatedSwitcherPage(),
  // '/AnimatedSizePage': (context) => AnimatedSizePage(),
  
};

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