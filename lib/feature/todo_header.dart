import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterappreduxtodo/feature/action/add_todo_action.dart';
import 'package:flutterappreduxtodo/model/app_state.dart';
import 'package:flutterappreduxtodo/model/todo.dart';

class TodoHeader extends StatelessWidget {
  final txtTodoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: txtTodoController,
              decoration: InputDecoration(
                hintText: 'Enter todo',
              ),
            ),
          ),
          StoreConnector<AppState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(
                    AddTodoAction(
                      Todo(
                        id: Random().nextInt(1000000).toString(),
                        name: txtTodoController.text,
                        isCompleted: false,
                      ),
                    ),
                  );
            },
            builder: (context, callback) => IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                if (txtTodoController.text.isEmpty) {
                  return;
                }
                callback();
                txtTodoController.clear();
              },
            ),
          )
        ],
      ),
    );
  }
}
