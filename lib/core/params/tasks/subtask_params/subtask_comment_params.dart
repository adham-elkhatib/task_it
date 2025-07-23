import '../base_subtask_params.dart';

class SubtaskCommentParams extends BaseSubtaskParams {
  final String content;

  const SubtaskCommentParams({required super.subtaskId, required this.content});
}
