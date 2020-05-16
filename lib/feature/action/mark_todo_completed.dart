import 'package:flutterappreduxtodo/model/todo.dart';

class MarkTodoCompleteAction {
  final Todo todo;

  MarkTodoCompleteAction(this.todo);

  @override
  String toString() {
    return 'MarkTodoCompleteAction{todo: ${todo.isCompleted}, ${todo.name}';
  }
}
