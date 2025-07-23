import '../base_task_params.dart';

class TaskAttachmentIdParams extends BaseTaskParams {
  final String attachmentId;

  const TaskAttachmentIdParams({
    required super.taskId,
    required this.attachmentId,
  });
}
