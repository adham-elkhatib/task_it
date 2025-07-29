import '../../base_subtask_params.dart';

class CreateSubtaskAttachmentParams extends BaseSubtaskParams {
  final String fileUrl;
  final String fileName;

  const CreateSubtaskAttachmentParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.fileUrl,
    required this.fileName,
  });
}
