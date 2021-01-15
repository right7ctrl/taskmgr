import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/enums.dart';
import 'package:task_manager/model/list/list_item_model.dart';

class ListProvider with ChangeNotifier {
  List<ListItemModel> _items = [
    ListItemModel(title: 'Lorem ipsum dolor sit', description: 'Lorem ipsum description', period: TaskPeriod.DAILY, status: TaskStatus.DONE),
  ];

  List<ListItemModel> get items => _items;
}
