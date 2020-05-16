import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterappreduxtodo/feature/action/DeleteTodoAction.dart';
import 'package:flutterappreduxtodo/feature/action/mark_todo_completed.dart';
import 'package:flutterappreduxtodo/model/app_state.dart';
import 'package:flutterappreduxtodo/model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  TodoItem(this.todo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: StoreConnector<AppState, Todo>(
              converter: (store) {
                return store.state.todos.firstWhere(
                    (element) => element.id == todo.id,
                    orElse: () => Todo());
              },
              builder: (context, convertTodo) {
                return Text(
                  todo.name,
                  style: convertTodo.isCompleted
                      ? TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        )
                      : TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                );
              },
            ),
          ),
          Row(
            children: <Widget>[
              StoreConnector<AppState, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(
                        MarkTodoCompleteAction(todo),
                      );
                },
                builder: (context, callback) => IconButton(
                  icon: Icon(
                    Icons.done,
                    color: Colors.green,
                  ),
                  onPressed: callback,
                ),
              ),
              StoreConnector<AppState, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(
                        DeleteTodoAction(
                          Todo(
                            id: todo.id,
                          ),
                        ),
                      );
                },
                builder: (context, callback) => IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: callback,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
