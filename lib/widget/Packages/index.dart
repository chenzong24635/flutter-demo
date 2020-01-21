import 'package:flutter/material.dart';

import 'package:flutter1/main.dart';

import './toast.dart';
import './cached_network_image.dart';
import './transparent_image.dart';
import './image_picker.dart';
import './flutter_swiper.dart';
import './english_words.dart';
import './modal_progress_hud.dart';
import './flutter_easyrefresh.dart';


final List<String> myRoutesName = <String>[
  'toast',
  // 'cached_network_image',
  'transparent_image',
  'image_picker',
  'flutter_swiper',
  'english_words',
  'modal_progress_hud',
  'flutter_easyrefresh',
];
Map<String, WidgetBuilder> myRoutes = {
  "/toast": (context) => ToastPage(),
  // "/cached_network_image": (context) => cached_image_network_page(),
  "/transparent_image": (context) => transparent_image_page(),
  "/image_picker": (context) => image_picker_page(),
  "/flutter_swiper_page": (context) => flutter_swiper_page(),
  "/english_words": (context) => english_words_page(),
  "/modal_progress_hud_page": (context) => modal_progress_hud_page(),
  "/flutter_easyrefresh_page": (context) => flutter_easyrefresh_page(),
};

class PackagesPage extends StatelessWidget{
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
        title: Text('第三方包'),
        leading: IconButton(
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