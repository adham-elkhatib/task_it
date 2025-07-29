import '../../base_subtask_params.dart';

class SubtaskTagIdParams extends BaseSubtaskParams {
  final String id;

  const SubtaskTagIdParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.id,
  });
}
