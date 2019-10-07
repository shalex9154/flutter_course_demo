import 'dart:io';
import 'package:flutter/material.dart';
import 'package:test_camera/flows/create_place/widgets/select_photo.dart';
import 'package:test_camera/models/favorite_place.dart';

// A screen that allows users to take a picture using a given camera.
class CreatePlacePage extends StatefulWidget {
  @override
  _CreatePlacePageState createState() => _CreatePlacePageState();
}

class _CreatePlacePageState extends State<CreatePlacePage> {
  File _photo;
  String _placeName = '';
  String _placeDescription = '';

  void _updatePhoto(File photo) {
    setState(() {
      _photo = photo;
    });
  }

  void _save(BuildContext context) {
    if (_photo == null || _placeDescription.isEmpty || _placeName.isEmpty) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: const Text(
              'Photo, place name and place description must be specified.'),
          backgroundColor: Theme.of(context).accentColor,
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      final place = FavoritePlace(_placeName, _placeDescription, _photo);
      Navigator.pop(context, place);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create your favourite place'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  SelectPhoto(
                      photo: _photo,
                      updatePhoto: (File photo) {
                        _updatePhoto(photo);
                      }),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        labelText: 'Enter picture name'),
                    onChanged: (text) {
                      _placeName = text;
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        labelText: 'Enter description'),
                    onChanged: (text) {
                      _placeDescription = text;
                    },
                  ),
                  RaisedButton(
                    child: const Text('Create'),
                    onPressed: () {
                      _save(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
