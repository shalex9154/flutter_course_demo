import 'package:flutter/material.dart';

class AnimatedPositionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedPositionPageState();
  }
}

class _AnimatedPositionPageState extends State<AnimatedPositionPage> {
  bool shouldShowText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated position'),
      ),
      body: Stack(children: <Widget>[
        const Positioned(
          top: 200,
          left: 100,
          child: Text('Hello world'),
        ),
        Positioned(
          left: 100,
          top: 300,
          child: AnimatedOpacity(
            opacity: shouldShowText ? 1 : 0,
            child: const Text('Hello new world'),
            duration: const Duration(seconds: 2),
            curve: Interval(0.7, 1, curve: Curves.easeIn),
          ),
        ),
        AnimatedPositioned(
          top: shouldShowText ? 200 : 300,
          left: 100,
          child: Container(
            width: 200,
            height: 100,
            color: Colors.blue,
          ),
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.update),
        onPressed: () {
          setState(() {
            shouldShowText = !shouldShowText;
          });
        },
      ),
    );
  }
}
