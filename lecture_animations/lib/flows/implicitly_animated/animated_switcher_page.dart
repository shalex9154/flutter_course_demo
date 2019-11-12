import 'package:flutter/material.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedSwitcherState();
  }
}

class _AnimatedSwitcherState extends State<AnimatedSwitcherPage> {
  bool shouldShowRight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(
              child: RaisedButton(
                child: Text(shouldShowRight ? 'Right' : 'Left'),
                onPressed: () {
                  setState(() {
                    shouldShowRight = !shouldShowRight;
                  });
                },
              ),
            ),
            AnimatedSwitcher(
              child: _positionedWidget(),
              duration: const Duration(seconds: 1),
            )
          ],
        ),
      ),
    );
  }

  Widget _positionedWidget() {
    if (shouldShowRight) {
      return Align(
        key: const ValueKey<String>('Right widget'),
        alignment: Alignment.centerRight,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
      );
    } else {
      return Align(
        key: const ValueKey<String>('Left widget'),
        alignment: Alignment.centerLeft,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.yellow,
        ),
      );
    }
  }
}
