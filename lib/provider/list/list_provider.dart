import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/enums.dart';
import 'package:task_manager/model/list/list_item_model.dart';

class ListProvider with ChangeNotifier {
  /// use it to filter the [_items] by their periods
  TaskPeriod taskPeriod;

  List<ListItemModel> _items = [
    ListItemModel(title: 'Lorem ipsum dolor sit', description: 'Lorem ipsum description', period: TaskPeriod.DAILY, status: TaskStatus.DONE),
    ListItemModel(title: 'Lorem ipsum dolor sit', description: 'Lorem ipsum description', period: TaskPeriod.WEEKLY, status: TaskStatus.DONE),
    ListItemModel(title: 'Lorem ipsum dolor sit', description: 'Lorem ipsum description', period: TaskPeriod.MONTHLY, status: TaskStatus.DONE),
    ListItemModel(title: 'Lorem ipsum dolor sit', description: 'Lorem ipsum description', period: TaskPeriod.WEEKLY, status: TaskStatus.DONE),
    ListItemModel(title: 'Lorem ipsum dolor sit', description: 'Lorem ipsum description', period: TaskPeriod.DAILY, status: TaskStatus.DONE),
    ListItemModel(title: 'Lorem ipsum dolor sit', description: 'Lorem ipsum description', period: TaskPeriod.DAILY, status: TaskStatus.DONE),
  ];

  List<ListItemModel> get items {
    _items ??= [];
    if (taskPeriod == null) return _items;
    return _items.where((element) => element.period == taskPeriod).toList();
  }

  /// should return the correct value while [ListView] needs it, even [_items] filtered by their periods
  int get itemsLength => items?.length ?? 0;

  set setPeriod(TaskPeriod period) {
    if (period == taskPeriod) return;
    taskPeriod = period;
    notifyListeners();
  }
}
