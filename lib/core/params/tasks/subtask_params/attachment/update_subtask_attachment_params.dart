import '../../base_subtask_params.dart';

class UpdateSubtaskAttachmentParams extends BaseSubtaskParams {
  final String id;
  final String fileUrl;
  final String fileName;

  const UpdateSubtaskAttachmentParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.id,
    required this.fileUrl,
    required this.fileName,
  });
}
