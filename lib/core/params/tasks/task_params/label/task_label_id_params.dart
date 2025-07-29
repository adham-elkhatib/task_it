import '../../base_task_params.dart';

class TaskLabelIdParams extends BaseTaskParams {
  final String labelId;

  const TaskLabelIdParams({required super.taskId, required this.labelId});
}
