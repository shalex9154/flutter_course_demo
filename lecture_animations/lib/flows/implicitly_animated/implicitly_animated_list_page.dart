import 'package:flutter/material.dart';
import 'package:lecture_animations/flows/implicitly_animated/animated_container_page.dart';
import 'package:lecture_animations/flows/implicitly_animated/animated_position_page.dart';
import 'package:lecture_animations/flows/implicitly_animated/animated_switcher_page.dart';

class ImplisitlyAnimatedListPage extends StatelessWidget {
  final _items = [
    'Animated Container',
    'Animated position and opacity',
    'Test 1'
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
        return AnimatedContainerPage();
      case 1:
        return AnimatedPositionPage();
      case 2:
        return AnimatedSwitcherPage();
      default:
        return null;
    }
  }
}
