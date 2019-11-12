import 'package:flutter/material.dart';

class FadeTransitionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FadeTransitionPageState();
  }
}

class _FadeTransitionPageState extends State<FadeTransitionPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FadeTransition'),
      ),
      body: Container(
          color: Colors.white,
          child: FadeTransition(
              opacity: animation,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.check,
                  size: 100.0,
                  color: Colors.green,
                ),
              ]))),
    );
  }
}
