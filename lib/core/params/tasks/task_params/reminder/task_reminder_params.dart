import '../../base_task_params.dart';

class TaskReminderParams extends BaseTaskParams {
  final DateTime time;

  // todo replace with simple data types
  final int repeatType;

  const TaskReminderParams({
    required super.taskId,
    required super.spaceId,

    required this.time,
    required this.repeatType,
  });
}
