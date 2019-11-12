import 'package:flutter/material.dart';
import 'package:lecture_animations/flows/hero/normal_transition/hero_end_page.dart';

class HeroStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TopLeft'),
        ),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                child: Hero(
                  tag: 'My hero icon',
                  child: Icon(Icons.cake),
                ),
                onTap: () => Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HeroEndPage())),
              ),
            )
          ],
        ));
  }
}
