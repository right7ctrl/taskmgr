import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/provider/list/list_provider.dart';
import 'package:task_manager/widget/list/list_item.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: CupertinoTextField(
              padding: const EdgeInsets.all(8),
              placeholder: 'Search Task',
              prefix: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Consumer<ListProvider>(
            builder: (context, provider, _) {
              return ListView.separated(
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return ListItem(data: provider.items.elementAt(index));
                },
                separatorBuilder: (context, index) => SizedBox(height: 12),
                itemCount: provider.itemsLength,
              );
            },
          ))
        ],
      ),
    );
  }
}
