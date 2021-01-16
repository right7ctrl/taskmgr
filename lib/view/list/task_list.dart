import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/core/constants/enums.dart';
import 'package:task_manager/provider/list/list_provider.dart';
import 'package:task_manager/view/add/add_task.dart';
import 'package:task_manager/widget/list/list_item.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Task List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddTask.show(context);
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              onTap: (int val) {
                print(val);
                TaskPeriod period;
                if (val != 0) period = TaskPeriod.values[val - 1];
                context.read<ListProvider>().setPeriod = period;
              },
              tabs: [
                Tab(child: Text('All')),
                Tab(child: Text('Daily')),
                Tab(child: Text('Weekly')),
                Tab(child: Text('Monthly')),
              ],
            ),
          ),
          Expanded(
            child: Consumer<ListProvider>(
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
            ),
          ),
        ],
      ),
    );
  }
}
