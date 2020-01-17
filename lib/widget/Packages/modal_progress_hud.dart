//https://pub.dev/packages/modal_progress_hud --进行网络请求等操作时的loading状态  


import 'dart:async';
import 'package:flutter/material.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';

import './modal_progress_hud1.dart';


class modal_progress_hud_page extends StatefulWidget {
  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<modal_progress_hud_page> {
  bool _saving = false;
  bool _bedroom = false;

  void _submit() {

    setState(() {
      _saving = true;
      
    });

    //Simulate a service call
    print('submitting to backend...');
    new Future.delayed(new Duration(seconds: 1), () {
      setState(() {
        _saving = false;
        _bedroom = !_bedroom;
      });
    });
  }

  Widget _buildWidget() {
    return new Form(
      child: new Column(
        children: [
          new SwitchListTile(
            title: const Text('Bedroom'),
            value: _bedroom,
            onChanged: (bool value) {
              setState(() {
                _bedroom = value;
              });
            },
            secondary: const Icon(Icons.hotel),
          ),
          new RaisedButton(
            onPressed: _submit,
            child: new Text('Save'),
          ),
          SizedBox(height: 20.0,),
          new RaisedButton(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => modal_progress_hud_page1()));
            },
            child: new Text('更多'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Progress Indicator Demo'),
        backgroundColor: Colors.blue,
      ),
      body: ModalProgressHUD(child: _buildWidget(), inAsyncCall: _saving),
    );
  }
}