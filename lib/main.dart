import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterappreduxtodo/feature/home_page.dart';
import 'package:flutterappreduxtodo/feature/reducer/app_reducer.dart';
import 'package:flutterappreduxtodo/model/app_state.dart';
import 'package:redux/redux.dart';

import 'feature/middleware/todo_middleware.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: Store<AppState>(
        appReducer,
        initialState: AppState(),
        middleware: createStoreTodosMiddleware(),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
