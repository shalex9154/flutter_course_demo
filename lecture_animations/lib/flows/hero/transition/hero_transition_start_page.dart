import 'package:flutter/material.dart';
import 'package:lecture_animations/flows/hero/transition/hero_transition_end_page.dart';

class HeroTransitionStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Module 1'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 100,
              child: FlatButton(
                child: const Text('Go to Module 2'),
                onPressed: () => Navigator.push<void>(context, MaterialPageRoute(builder: (BuildContext context) => HeroTransitionEndPage())),
              ),
            ),
            Expanded(child: GridView.count(
                crossAxisCount: 5,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                padding: const EdgeInsets.all(4),
                children: List.generate(40, (index) => _person(index))),),
          ],
        ));
  }

  Widget _person(int index) {
    if (index%4 == 0) {
      final tagIndex = (index/4).round();
      return Hero(
        transitionOnUserGestures: true,
        child: Icon(Icons.person),
        tag: 'person $tagIndex',
      );
    } else {
      return Icon(Icons.person);
    }
  }
}
