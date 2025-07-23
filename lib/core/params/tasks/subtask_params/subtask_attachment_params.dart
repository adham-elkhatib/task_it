import '../base_subtask_params.dart';

class SubtaskAttachmentParams extends BaseSubtaskParams {
  final String fileUrl;
  final String fileName;

  const SubtaskAttachmentParams({
    required super.subtaskId,
    required this.fileUrl,
    required this.fileName,
  });
}
