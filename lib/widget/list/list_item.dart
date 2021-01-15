import 'package:flutter/material.dart';
import 'package:task_manager/model/list/list_item_model.dart';

class ListItem extends StatelessWidget {
  final ListItemModel data;

  const ListItem({Key key, this.data}) : super(key: key);

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
                  'Item title Item title Item title Item title Item title Item title',
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
                    'Monthly',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet',
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
                      Container(
                        padding: EdgeInsets.all(6),
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                        child: Icon(Icons.delete),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                        child: Icon(Icons.delete),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                        child: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
                Chip(
                  label: Text('Complete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
