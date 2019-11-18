import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {

  List<String> items = ['Test object'];
  
  final _textFieldController = TextEditingController();

  Future _addNewItem(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Write new action todo'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: 'Todo action'),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: const Text('Add'),
                onPressed: () {
                  setState(() {
                    if (_textFieldController.text.isNotEmpty) {
                      items.add(_textFieldController.text);
                      _textFieldController.clear();
                    }
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Todo list')),
        body: _buildList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addNewItem(context),
          tooltip: 'Add',
          child: Icon(Icons.add),
        ));
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return ListTile(title: Text(items[index]));
        });
  }
}
