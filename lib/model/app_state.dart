import 'package:flutter/material.dart';
import 'package:flutterappreduxtodo/model/todo.dart';

@immutable
class AppState {
  final List<Todo> todos;

  AppState({this.todos = const []});

  @override
  int get hashCode => todos.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          todos == other.todos;

  @override
  String toString() {
    return 'AppState{isLoading: todos: $todos}';
  }
}
