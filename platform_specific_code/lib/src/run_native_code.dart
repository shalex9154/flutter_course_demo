import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeCodeRunPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NativeCodeRunPageState();
  }
}

class _NativeCodeRunPageState extends State<NativeCodeRunPage> {
  int _batteryLevel;

  Future<void> _getBatteryLevel() async {
    const platform = MethodChannel('ciklum.flutter.dev/battery');
    try {
      final int batteryLevel = await platform.invokeMethod('getBatteryLevel');
      setState(() {
        _batteryLevel = batteryLevel;
      });
    } on PlatformException catch(error) {
      setState(() {
        _batteryLevel = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Native code'),),
      body: Center(child: Text('level - $_batteryLevel'),),);
  }
}