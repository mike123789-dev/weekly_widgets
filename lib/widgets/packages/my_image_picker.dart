import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePicker extends StatefulWidget {
  @override
  _MyImagePickerState createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  File _image;

  final picker = ImagePicker();

  Future getImage({@required ImageSource source}) async {
    final pickedFile = await picker.getImage(
      source: source,
      maxWidth: 600,
    );

    setState(() async {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _image == null ? Text('No image selected.') : Image.file(_image),
        TextButton(
          child: Text("pick image from camera"),
          onPressed: () {
            getImage(source: ImageSource.camera);
          },
        ),
        TextButton(
          child: Text("pick image from gallery"),
          onPressed: () {
            getImage(source: ImageSource.gallery);
          },
        ),
      ],
    );
  }
}
