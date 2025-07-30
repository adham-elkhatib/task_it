import '../../../../../features/project/domain/entities/priority_enum.dart';
import '../../../../../features/project/domain/entities/status_enum.dart';
import '../../base_task_params.dart';

class UpdateTaskParams extends BaseTaskParams {
  final String? title;
  final List<String>? assigneeIds;
  final DateTime? deadline;
  final TaskStatus? taskStatus;
  final Priority? priority;

  const UpdateTaskParams({
    required super.taskId,
    required super.spaceId,

    this.title,
    this.assigneeIds,
    this.deadline,
    this.priority,
    this.taskStatus,
  });
}
