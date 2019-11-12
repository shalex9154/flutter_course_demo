import 'package:flutter/material.dart';
import 'package:lecture_animations/flows/hero/transition/hero_transition_start_page.dart';

class HeroListPage extends StatelessWidget {
  final _items = ['Hero transition'];

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
        return HeroTransitionStartPage();
      default:
        return null;
    }
  }
}