import 'package:task_manager/core/constants/enums.dart';

class ListItemModel {
  final String title;
  final String description;
  final TaskPeriod period;
  final TaskStatus status;

  ListItemModel({this.title, this.description, this.period, this.status});
}
