import '../../base_task_params.dart';

class TaskReminderParams extends BaseTaskParams {
  final DateTime time;

  const TaskReminderParams({required super.taskId, required this.time});
}
