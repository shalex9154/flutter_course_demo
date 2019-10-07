import 'package:flutter/material.dart';
import 'package:lecture_3_image_viewer/widgets/image_details_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(5),
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          children: <Widget>[
            Ink.image(
              image: AssetImage('resources/cats/1.jpg'),
              fit: BoxFit.cover,
              child: InkWell(onTap: () {
                Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageDetailsPage(
                            assetPath: 'resources/cats/1.jpg')));
              }),
            ),
            Ink.image(
              image: AssetImage('resources/cats/2.jpeg'),
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {
                  Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageDetailsPage(
                              assetPath: 'resources/cats/2.jpeg')));
                },
              ),
            ),
            Ink.image(
              image: AssetImage('resources/cats/3.jpg'),
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {
                  Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageDetailsPage(
                              assetPath: 'resources/cats/3.jpg')));
                },
              ),
            ),
            Ink.image(
              image: AssetImage('resources/cats/4.jpg'),
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {
                  Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageDetailsPage(
                              assetPath: 'resources/cats/4.jpg')));
                },
              ),
            ),
            Ink.image(
              image: AssetImage('resources/cats/5.jpeg'),
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {
                  Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageDetailsPage(
                              assetPath: 'resources/cats/5.jpeg')));
                },
              ),
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
