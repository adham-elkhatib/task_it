import '../../base_subtask_params.dart';

class CreateSubtaskCommentParams extends BaseSubtaskParams {
  final String content;

  const CreateSubtaskCommentParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.content,
  });
}
