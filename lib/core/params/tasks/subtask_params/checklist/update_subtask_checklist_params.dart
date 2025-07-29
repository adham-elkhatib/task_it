import '../../base_subtask_params.dart';

class UpdateSubtaskChecklistParams extends BaseSubtaskParams {
  final String id;
  final String content;

  const UpdateSubtaskChecklistParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.id,
    required this.content,
  });
}
