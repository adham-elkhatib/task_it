import '../../../../../features/project/domain/entities/priority_enum.dart';
import '../../../../../features/project/domain/entities/status_enum.dart';

class CreateTaskParams {
  final String title;
  final String? projectId;
  final List<String>? assigneeId;
  final DateTime? deadline;
  final TaskStatus? taskStatus;
  final Priority? priority;

  const CreateTaskParams({
    required this.title,
    required this.projectId,
    required this.assigneeId,
    required this.deadline,
    this.taskStatus,
    this.priority,
  });
}
