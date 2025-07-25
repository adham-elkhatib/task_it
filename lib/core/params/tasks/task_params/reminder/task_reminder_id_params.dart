import '../../base_task_params.dart';

class TaskReminderIdParams extends BaseTaskParams {
  final String reminderId;

  const TaskReminderIdParams({required super.taskId, required this.reminderId});
}
