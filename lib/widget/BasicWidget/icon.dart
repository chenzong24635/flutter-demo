import 'package:flutter/material.dart';

class IconPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Icon')),
      body: GridView.count(
        crossAxisCount: 4,
        children: <Widget>[
          Icon(Icons.account_box, color: Colors.black, size: 16),
          Icon(Icons.add_a_photo, color: Colors.red, size: 18),
          Icon(Icons.add_circle, color: Colors.black, size: 22),
          Icon(Icons.android, color: Colors.orange, size: 24),
          Icon(Icons.cast_connected, color: Colors.black, size: 26),
          Icon(Icons.verified_user, color: Colors.green, size: 28),
          Icon(Icons.dashboard, color: Colors.black, size: 30),
          Icon(Icons.account_box, color: Colors.black, size: 16),
          Icon(Icons.add_a_photo, color: Colors.red, size: 18),
          Icon(Icons.add_circle, color: Colors.black, size: 22),
          Icon(Icons.android, color: Colors.orange, size: 24),
          Icon(Icons.cast_connected, color: Colors.black, size: 26),
          Icon(Icons.verified_user, color: Colors.green, size: 28),
          Icon(Icons.dashboard, color: Colors.black, size: 30),
          Icon(Icons.account_box, color: Colors.black, size: 16),
          Icon(Icons.add_a_photo, color: Colors.red, size: 18),
          Icon(Icons.add_circle, color: Colors.black, size: 22),
          Icon(Icons.android, color: Colors.orange, size: 24),
          Icon(Icons.cast_connected, color: Colors.black, size: 26),
          Icon(Icons.verified_user, color: Colors.green, size: 28),
          Icon(Icons.dashboard, color: Colors.black, size: 30),
          Icon(Icons.account_box, color: Colors.black, size: 16),
          Icon(Icons.add_a_photo, color: Colors.red, size: 18),
          Icon(Icons.add_circle, color: Colors.black, size: 22),
          Icon(Icons.android, color: Colors.orange, size: 24),
          Icon(Icons.cast_connected, color: Colors.black, size: 26),
          Icon(Icons.verified_user, color: Colors.green, size: 28),
          Icon(Icons.dashboard, color: Colors.black, size: 30),
        ],
      )
    );
  }
}