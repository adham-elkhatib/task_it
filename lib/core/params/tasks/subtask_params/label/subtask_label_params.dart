import '../../base_subtask_params.dart';

class SubtaskLabelParams extends BaseSubtaskParams {
  final String name;
  final String colorHex;

  const SubtaskLabelParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.name,
    required this.colorHex,
  });
}
