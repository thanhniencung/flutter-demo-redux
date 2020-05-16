import 'package:flutterappreduxtodo/feature/action/DeleteTodoAction.dart';
import 'package:flutterappreduxtodo/feature/action/add_todo_action.dart';
import 'package:flutterappreduxtodo/feature/action/mark_todo_completed.dart';
import 'package:flutterappreduxtodo/model/todo.dart';
import 'package:redux/redux.dart';

final todosReducer = combineReducers<List<Todo>>([
  TypedReducer<List<Todo>, AddTodoAction>(_addTodo),
  TypedReducer<List<Todo>, DeleteTodoAction>(_deleteTodo),
  TypedReducer<List<Todo>, MarkTodoCompleteAction>(_markTodoIsCompleted),
]);

List<Todo> _addTodo(
  List<Todo> todos,
  AddTodoAction action,
) {
  return List.from(todos)..add(action.todo);
}

List<Todo> _deleteTodo(
  List<Todo> todos,
  DeleteTodoAction action,
) {
  return todos.where((todo) => todo.id != action.todo.id).toList();
}

List<Todo> _markTodoIsCompleted(
  List<Todo> todos,
  MarkTodoCompleteAction action,
) {
  return todos.map((todo) {
    if (todo.id == action.todo.id) {
      todo.isCompleted = true;
    }
    return todo;
  }).toList();
}
