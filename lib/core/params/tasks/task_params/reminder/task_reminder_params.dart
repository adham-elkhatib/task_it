import '../../../../../features/task/domain/entities/reminder_entity.dart';
import '../../base_task_params.dart';

class TaskReminderParams extends BaseTaskParams {
  final DateTime time;

  // todo replace with simple data types
  final ReminderRepeatType repeatType;

  const TaskReminderParams({
    required super.taskId,
    required this.time,
    required this.repeatType,
  });
}
