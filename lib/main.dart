import 'package:flutter/material.dart';
import 'package:task_manager/view/list/task_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskList(),
    );
  }
}
