import '../../base_task_params.dart';

class TaskAttachmentParams extends BaseTaskParams {
  final String fileUrl;
  final String fileName;

  const TaskAttachmentParams({
    required super.taskId,
    required this.fileUrl,
    required this.fileName,
  });
}
