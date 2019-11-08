import 'package:flutter/material.dart';
import 'package:lecture_animations/flows/implicitly_animated/container/animated_container_page.dart';

class ImplisitlyAnimatedListPage extends StatelessWidget {
  final _items = ['Animated Container'];

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
        return AnimatedContainerPage();
      default:
        return null;
    }
  }
}
