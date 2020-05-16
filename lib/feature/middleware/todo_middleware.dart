//https://pub.dev/packages/redux_thunk
import 'package:flutterappreduxtodo/feature/action/DeleteTodoAction.dart';
import 'package:flutterappreduxtodo/feature/action/add_todo_action.dart';
import 'package:flutterappreduxtodo/feature/action/mark_todo_completed.dart';
import 'package:flutterappreduxtodo/model/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreTodosMiddleware() {
  final addTodoLogger = _addTodoLogger();
  final delTodoLogger = _delTodoLogger();
  final markTodoCompleteLogger = _markTodoCompleteLogger();

  return [
    TypedMiddleware<AppState, AddTodoAction>(addTodoLogger),
    TypedMiddleware<AppState, DeleteTodoAction>(delTodoLogger),
    TypedMiddleware<AppState, MarkTodoCompleteAction>(markTodoCompleteLogger),
  ];
}

Middleware<AppState> _addTodoLogger() {
  return (Store<AppState> store, action, NextDispatcher next) {
    print(action.toString());
    next(action);
  };
}

Middleware<AppState> _delTodoLogger() {
  return (Store<AppState> store, action, NextDispatcher next) {
    print(action.toString());
    next(action);
  };
}

Middleware<AppState> _markTodoCompleteLogger() {
  return (Store<AppState> store, action, NextDispatcher next) {
    print(action.toString());
    next(action);
  };
}
