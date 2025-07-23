import '../base_subtask_params.dart';

class SubtaskAssigneeParams extends BaseSubtaskParams {
  final String userId;

  const SubtaskAssigneeParams({required super.subtaskId, required this.userId});
}
