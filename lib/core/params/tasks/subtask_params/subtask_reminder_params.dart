import '../base_subtask_params.dart';

class SubtaskReminderParams extends BaseSubtaskParams {
  final DateTime time;

  const SubtaskReminderParams({required super.subtaskId, required this.time});
}
