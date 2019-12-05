import 'package:flutter/material.dart';
import 'package:platform_specific_code/src/run_native_code.dart';
import 'package:platform_specific_code/src/test_view_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestViewPage()//NativeCodeRunPage(),
    );
  }
}