import '../../base_subtask_params.dart';

class SubtaskReminderParams extends BaseSubtaskParams {
  final DateTime time;
  final int repeatType;

  const SubtaskReminderParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.time,
    required this.repeatType,
  });
}
