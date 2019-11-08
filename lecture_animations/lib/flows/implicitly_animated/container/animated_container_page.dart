import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnimatedContainerPageState();
  }
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  final random = Random();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Container')),
      body: Center(
        child: AnimatedContainer(
          color: Colors.red,
          width: 100 * random.nextDouble(),
          height: 100 * random.nextDouble(),
          duration: Duration(seconds: 1),
          ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => setState(() {}),
            child: Icon(Icons.refresh),
          ),
      );
  }
}