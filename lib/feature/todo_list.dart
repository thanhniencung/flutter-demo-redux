import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterappreduxtodo/feature/todo_item.dart';
import 'package:flutterappreduxtodo/model/app_state.dart';
import 'package:flutterappreduxtodo/model/todo.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Todo>>(
      converter: (store) => store.state.todos,
      builder: (context, todos) {
        if (todos.length == 0) {
          return Container(
            child: Text("Empty"),
          );
        }
        return Container(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                return TodoItem(todos[index]);
              }),
        );
      },
    );
  }
}
