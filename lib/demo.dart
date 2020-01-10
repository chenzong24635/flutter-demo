import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class DemoPage extends StatelessWidget {
  const DemoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('sdsd');
    /* return SliverAppBar(
            title: Text('SliverAppBar'),
            backgroundColor: Colors.amber,
            pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('FlexibleSpaceBar'),
              background: Image(
                image: AssetImage('images/th.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ); */
  }
}