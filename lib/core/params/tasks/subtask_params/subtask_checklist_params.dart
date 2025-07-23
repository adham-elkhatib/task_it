import '../base_subtask_params.dart';

class SubtaskChecklistParams extends BaseSubtaskParams {
  final List<String> items;

  const SubtaskChecklistParams({required super.subtaskId, required this.items});
}
