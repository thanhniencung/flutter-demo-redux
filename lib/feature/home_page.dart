import 'package:flutter/material.dart';
import 'package:flutterappreduxtodo/feature/todo_header.dart';
import 'package:flutterappreduxtodo/feature/todo_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TodoHeader(),
            Expanded(
              child: TodoList(),
            )
          ],
        ),
      ),
    );
  }
}
