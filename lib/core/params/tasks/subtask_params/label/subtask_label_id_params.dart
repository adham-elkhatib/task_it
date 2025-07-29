import '../../base_subtask_params.dart';

class SubtaskLabelIdParams extends BaseSubtaskParams {
  final String id;

  const SubtaskLabelIdParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.id,
  });
}
