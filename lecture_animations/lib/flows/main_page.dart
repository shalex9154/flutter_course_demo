import 'package:flutter/material.dart';
import 'package:lecture_animations/flows/implicitly_animated/implicitly_animated_list_page.dart';

class MainPage extends StatelessWidget {
  final _items = ['Implicit animations'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation')),
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
        return ImplisitlyAnimatedListPage();
      default:
        return null;
    }
  }
}