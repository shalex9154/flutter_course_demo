import 'package:flutter/material.dart';

class HeroTransitionEndPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Module 2'),), 
    body: GridView.count(
      crossAxisCount: 3,
      children: List.generate(10, (index) {
        return Hero(tag: 'person $index', child: Icon(Icons.person),);
      }),
    ),
    );
  }
}