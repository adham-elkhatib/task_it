import '../../base_subtask_params.dart';

class SubtaskAttachmentIdParams extends BaseSubtaskParams {
  final String attachmentId;

  const SubtaskAttachmentIdParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.attachmentId,
  });
}
