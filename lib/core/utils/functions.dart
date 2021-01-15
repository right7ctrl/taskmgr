import 'package:task_manager/core/constants/enums.dart';

/// Takes param [period] as [TaskPeriod] enum class, returns as a string val
String getStringPeriod(TaskPeriod period) {
  switch (period) {
    case TaskPeriod.DAILY:
      return 'Daily';
      break;
    case TaskPeriod.WEEKLY:
      return 'Weekly';
      break;
    case TaskPeriod.MONTHLY:
      return 'Monthly';
      break;
    default:
      return null;
      break;
  }
}
