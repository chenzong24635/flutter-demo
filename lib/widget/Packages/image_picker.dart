//https://pub.dev/packages/image_picker

//从手机里获取图像，或相机拍摄新照片。

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class image_picker_page extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<image_picker_page> {
  File _image;

  Future getImageCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
  Future getImageGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Column(children: <Widget>[
        Center(
          child: _image == null
              ? Text('No image selected.')
              : Image.file(_image),
        ),
        ButtonBar(children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: getImageCamera ,
          ),
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: getImageGallery ,
          ),
        ],)
      ],),
    );
  }
}