import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class SelectPhoto extends StatelessWidget {
  const SelectPhoto({Key key, this.photo, this.updatePhoto}) : super(key: key);

  final File photo;
  final Function(File) updatePhoto;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        photo != null
            ? Image.file(photo)
            : Padding(
                padding: const EdgeInsets.all(22.0),
                child: Text(
                  'Select image before create',
                  style: TextStyle(color: Colors.red, fontSize: 18.0),
                )),
        RaisedButton(
          child: const Text('Take picture'),
          onPressed: _getImage,
        ),
      ],
    );
  }

  Future _getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    updatePhoto(image);
  }
}
