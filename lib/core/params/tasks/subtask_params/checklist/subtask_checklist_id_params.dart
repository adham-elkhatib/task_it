import '../../base_subtask_params.dart';

class SubtaskChecklistIdParams extends BaseSubtaskParams {
  final String checklistId;

  const SubtaskChecklistIdParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.checklistId,
  });
}
