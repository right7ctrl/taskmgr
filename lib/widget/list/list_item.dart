import 'package:flutter/material.dart';
import 'package:task_manager/model/list/list_item_model.dart';
import 'package:task_manager/widget/list/list_item_action.dart';

class ListItem extends StatelessWidget {
  final ListItemModel data;

  const ListItem({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    color: Colors.orange,
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
                      ListItemAction(onTap: () {}, icon: Icons.delete, marginRight: 8),
                      ListItemAction(onTap: () {}, icon: Icons.edit, marginRight: 8, bgColor: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
