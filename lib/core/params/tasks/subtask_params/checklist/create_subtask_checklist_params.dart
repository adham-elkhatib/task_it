import '../../base_subtask_params.dart';

class CreateSubtaskChecklistParams extends BaseSubtaskParams {
  final String content;

  const CreateSubtaskChecklistParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.content,
  });
}
