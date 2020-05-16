import 'package:flutterappreduxtodo/feature/reducer/todo_reducer.dart';
import 'package:flutterappreduxtodo/model/app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    todos: todosReducer(state.todos, action),
  );
}
