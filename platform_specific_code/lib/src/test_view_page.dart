import 'package:flutter/material.dart';

class TestViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fluff'),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: UiKitView(
              viewType: 'TestView',
            ),
          ),
        ),
      );
  }
}