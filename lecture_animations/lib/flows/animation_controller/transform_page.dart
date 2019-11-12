import 'dart:math';
import 'package:flutter/material.dart';

class TransformPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransformPageState();
  }
}

class _TransformPageState extends State<TransformPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 200.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transform'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Center(
              child: Transform.rotate(
                angle: -2 * pi * _animation.value / 200,
                child: Container(
                  width: 300,
                  height: 50,
                  color: Colors.yellowAccent,
                ),
              ),
            )),
            Expanded(
                flex: 1,
                child: Center(
                  child: FloatingActionButton(
                    onPressed: () {
                      _controller.repeat();
                    },
                    child: Icon(Icons.refresh),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
