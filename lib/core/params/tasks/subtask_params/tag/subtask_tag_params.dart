import '../../base_subtask_params.dart';

class SubtaskTagParams extends BaseSubtaskParams {
  final String name;

  const SubtaskTagParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.name,
  });
}
