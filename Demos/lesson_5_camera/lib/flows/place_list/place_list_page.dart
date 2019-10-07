import 'package:flutter/material.dart';
import 'package:test_camera/flows/create_place/create_place_page.dart';
import 'package:test_camera/flows/place_list/widgets/place_tile.dart';
import 'package:test_camera/models/favorite_place.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final places = <FavoritePlace>[];

  @override
  Widget build(BuildContext context) {
    //add data to list
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 5'),
      ),
      body: places.isEmpty
          ? Center(
              child: const Text('Press + to add a new place.'),
            )
          : ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return PlaceTile(place: places[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showCreatePlace(context),
      ),
    );
  }

  Future _showCreatePlace(BuildContext context) async {
    final FavoritePlace result = await Navigator.push(
        context,
        MaterialPageRoute<FavoritePlace>(
            builder: (context) => CreatePlacePage()));
    if (result != null) {
      setState(() {
        places.add(result);
      });
    }
  }
}
