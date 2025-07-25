import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/reminder_model.dart';
import '../../../models/subtask_model.dart';
import '../../base_task_remote_context.dart';

mixin SubtaskRemindersRemoteImpl on BaseTaskRemoteContext {
  Future<SubtaskModel> addSubtaskReminder(ReminderModel params) {
    // TODO: implement addSubtaskReminder
    throw UnimplementedError();
  }

  Future<SubtaskModel> removeSubtaskReminder(SubtaskReminderParams params) {
    // TODO: implement removeSubtaskReminder
    throw UnimplementedError();
  }
}
