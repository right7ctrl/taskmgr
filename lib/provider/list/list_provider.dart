import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/enums.dart';
import 'package:task_manager/model/list/list_item_model.dart';

class ListProvider with ChangeNotifier {
  /// use it to filter the [_items] by their periods
  TaskPeriod taskPeriod;

  List<ListItemModel> _items = [
    ListItemModel(id: 0, title: 'Lorem ipsum dolor sit', description: 'Lorem ipsum description', period: TaskPeriod.DAILY, status: TaskStatus.TODO),
    ListItemModel(id: 1, title: 'Lorem ipsum dolor sit', description: 'Lorem ipsum description', period: TaskPeriod.WEEKLY, status: TaskStatus.DONE),
    ListItemModel(id: 2, title: 'Lorem ipsum dolor sit', description: 'Lorem ipsum description', period: TaskPeriod.MONTHLY, status: TaskStatus.TODO),
    ListItemModel(id: 3, title: 'Lorem ipsum dolor sit', description: 'Lorem ipsum description', period: TaskPeriod.WEEKLY, status: TaskStatus.DONE),
    ListItemModel(id: 4, title: 'Lorem ipsum dolor sit', description: 'Lorem ipsum description', period: TaskPeriod.DAILY, status: TaskStatus.DONE),
    ListItemModel(id: 5, title: 'Lorem ipsum dolor sit', description: 'Lorem ipsum description', period: TaskPeriod.DAILY, status: TaskStatus.DONE),
  ];

  List<ListItemModel> get items {
    _items ??= <ListItemModel>[];

    /// if [taskPeriod] is null, that means user on the All Tab and should return all of [_items] with no filter.
    if (taskPeriod == null) return _items.reversed.toList();

    /// return items where [period] == [taskPeriod]
    return _items?.where((element) => element.period == taskPeriod)?.toList()?.reversed?.toList() ?? <ListItemModel>[];
  }

  /// should return the correct value while [ListView] needs it, even [_items] filtered by their periods.
  int get itemsLength => items?.length ?? 0;
  int get lastItemId {
    if (itemsLength == 0) return itemsLength;
    return _items?.last?.id ?? 0;
  }

  /// set [taskPeriod] on tab change
  set setPeriod(TaskPeriod period) {
    /// if [period] is already equal to [taskPeriod] should not update state again.
    if (period == taskPeriod) return;
    taskPeriod = period;
    notifyListeners();
  }

  void addItem(String title, String description) {
    _items.add(
      ListItemModel(
        description: description,
        title: title,
        id: lastItemId == 0 ? 0 : lastItemId + 1,
        period: TaskPeriod.DAILY,
        status: TaskStatus.TODO,
      ),
    );
    notifyListeners();
  }

  void markAsDone(int id) {
    var item = _items.where((element) => element.id == id).toList().first;
    item.status = TaskStatus.DONE;
    notifyListeners();
  }

  /// take [ListItemModel.id] as parameter to remove the task
  void removeItem(int id) {
    if (_items?.elementAt(id) == null) return;
    _items.removeAt(id);
    notifyListeners();
  }
}
