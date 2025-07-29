import '../../base_subtask_params.dart';

class UpdateSubtaskCommentParams extends BaseSubtaskParams {
  final String commentId;
  final String content;

  const UpdateSubtaskCommentParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.commentId,
    required this.content,
  });
}
