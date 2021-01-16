import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/enums.dart';
import 'package:task_manager/model/list/list_item_model.dart';

class ListProvider with ChangeNotifier {
  /// use it to filter the [_items] by their periods
  TaskPeriod taskPeriod;

  List<ListItemModel> _items = [
    ListItemModel(id: 0, title: 'First task', description: 'Lorem ipsum dolor sit amet', period: TaskPeriod.DAILY, status: TaskStatus.DONE),
    ListItemModel(id: 1, title: 'Lorem ipsum', description: 'Pellentesque cursus, ipsum ut accumsan', period: TaskPeriod.WEEKLY, status: TaskStatus.DONE),
    ListItemModel(id: 2, title: 'Pellentesque nibh', description: 'Quisque lacus tellus, aliquam eget purus ut', period: TaskPeriod.MONTHLY, status: TaskStatus.TODO),
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

  /// return the biggest id in the [_items] list
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

  void addItem(ListItemModel item) {
    item
      ..id = lastItemId == 0 ? 0 : lastItemId + 1
      ..status = TaskStatus.TODO;
    _items.add(item);
    notifyListeners();
  }

  void editItem(ListItemModel item) {
    int index = _items.indexOf(_items.where((element) => element.id == item.id).toList().first);

    /// if no items found with the [item.id] then do nothing
    if (index == -1) return;

    _items[index] = item;
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
