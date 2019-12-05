import 'package:flutter/material.dart';
import 'dart:io';

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
          child: platformView(),
        ),
      ),
    );
  }

  Widget platformView() {
    if (Platform.isIOS) {
      return UiKitView(
        viewType: 'TestView',
      );
    }
    if (Platform.isAndroid) {
      return AndroidView(viewType: 'MyView',);
    }
    return null;
  }
}
