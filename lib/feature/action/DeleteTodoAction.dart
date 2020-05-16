import 'package:flutterappreduxtodo/model/todo.dart';

class DeleteTodoAction {
  final Todo todo;

  DeleteTodoAction(this.todo);

  @override
  String toString() {
    return 'DeleteTodoAction: ${todo.id}';
  }
}
