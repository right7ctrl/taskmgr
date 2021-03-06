import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/provider/list/list_provider.dart';
import 'package:task_manager/view/list/task_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListProvider()),
      ],
      child: MaterialApp(
        title: 'Taskmgr',
        home: TaskList(),
      ),
    );
  }
}
