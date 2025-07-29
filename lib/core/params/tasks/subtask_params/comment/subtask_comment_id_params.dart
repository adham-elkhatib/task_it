import '../../base_subtask_params.dart';

class SubtaskCommentIdParams extends BaseSubtaskParams {
  final String commentId;

  const SubtaskCommentIdParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.commentId,
  });
}
