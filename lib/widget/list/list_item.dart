import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/enums.dart';
import 'package:task_manager/core/utils/functions.dart';
import 'package:task_manager/model/list/list_item_model.dart';
import 'package:task_manager/provider/list/list_provider.dart';
import 'package:task_manager/view/add/add_task.dart';
import 'package:task_manager/widget/list/list_item_action.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  final ListItemModel data;

  const ListItem({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listProvider = context.watch<ListProvider>();
    return Material(
      elevation: 8,
      color: Colors.white,
      shadowColor: Colors.white70,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  '${data.title}',
                  style: TextStyle(fontSize: 16),
                )),
                SizedBox(width: 24),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: getColorByPeriod(data?.period),
                  ),
                  child: Text(
                    '${data.stringPeriod}',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              '${data.description}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Divider(height: 24),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ///Delete to-do
                      ListItemAction(
                        onTap: () => listProvider.removeItem(data.id),
                        icon: Icons.delete,
                        marginRight: 8,
                      ),

                      /// Add to-do
                      ListItemAction(
                        onTap: () {
                          AddTask.show(context, initialData: data);
                        },
                        icon: Icons.edit,
                        marginRight: 8,
                        bgColor: Colors.blue,
                      ),
                    ],
                  ),
                ),
                if (data.status == TaskStatus.TODO) markAsDoneButton(listProvider),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget markAsDoneButton(ListProvider provider) {
    return Material(
      color: Colors.green,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: () {
          provider.markAsDone(data.id);
        },
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            'Mark as done',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
