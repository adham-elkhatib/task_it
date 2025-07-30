import '../../base_task_params.dart';

class CreateTaskAttachmentParams extends BaseTaskParams {
  final String fileUrl;
  final String fileName;

  const CreateTaskAttachmentParams({
    required super.taskId,
    required super.spaceId,

    required this.fileUrl,
    required this.fileName,
  });
}
