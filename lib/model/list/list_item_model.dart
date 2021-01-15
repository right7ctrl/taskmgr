import 'package:task_manager/core/constants/enums.dart';
import 'package:task_manager/core/utils/functions.dart';

class ListItemModel {
  final String title;
  final String description;
  final TaskPeriod period;
  final TaskStatus status;

  ListItemModel({this.title, this.description, this.period, this.status});

  String get stringPeriod => getStringPeriod(this.period);
}
