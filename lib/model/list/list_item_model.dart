import 'package:task_manager/core/constants/enums.dart';
import 'package:task_manager/core/utils/functions.dart';

class ListItemModel {
  int id;
  String title;
  String description;
  TaskPeriod period;
  TaskStatus status;

  ListItemModel({this.id, this.title, this.description, this.period, this.status});

  String get stringPeriod => getStringPeriod(this.period);
}
