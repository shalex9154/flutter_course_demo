import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tests_example/widgets/todo_list_widget.dart';

void main() {
  testWidgets('Find todo list', (WidgetTester tester) async {
    const todoKey = Key('Todo key');

    await tester.pumpWidget(MaterialApp(
      key: todoKey,
      home: TodoList(),
    ));

    expect(find.byKey(todoKey), findsOneWidget);
  });

  testWidgets('Find item in the list', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TodoList(),
    ));

    expect(find.text('Test object'), findsOneWidget);
  });

  testWidgets('Add item to the list', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TodoList(),
    ));

    expect(find.byType(ListTile), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));

    await tester.pump();

    await tester.enterText(find.byType(TextField), 'new item');

    await tester.pump();

    await tester.tap(find.text('Add'));

    await tester.pump();

    expect(find.text('new item'), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(2));
  });
}
