import 'package:flutterappreduxtodo/model/todo.dart';

class AddTodoAction {
  final Todo todo;

  AddTodoAction(this.todo);

  @override
  String toString() {
    return 'AddTodoAction: ${todo.name}';
  }
}
