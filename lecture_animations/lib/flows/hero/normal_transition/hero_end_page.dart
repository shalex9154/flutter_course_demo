import 'package:flutter/material.dart';

class HeroEndPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Center'),
        ),
        body: Stack(
          children: <Widget>[
            Align(alignment: Alignment.center, child: Hero(tag: 'My hero icon', child: Icon(Icons.cake),),)
          ],
        ));
  }
}