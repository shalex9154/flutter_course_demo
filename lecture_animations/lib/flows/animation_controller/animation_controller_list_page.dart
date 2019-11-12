import 'package:flutter/material.dart';
import 'package:lecture_animations/flows/animation_controller/transform_page.dart';

class AnimationControllerListPage extends StatelessWidget {
  final _items = [
    'Transform',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Implicit animation')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(_items[index]),
              onTap: () {
                Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => _getPage(index)));
              });
        },
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return TransformPage();
      default:
        return null;
    }
  }
}