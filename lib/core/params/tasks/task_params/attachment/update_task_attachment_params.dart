import '../../base_task_params.dart';

class UpdateTaskAttachmentParams extends BaseTaskParams {
  final String fileUrl;
  final String fileName;
  final String attachmentId;

  const UpdateTaskAttachmentParams({
    required super.taskId,
    required this.fileUrl,
    required this.fileName,
    required this.attachmentId,
  });
}
