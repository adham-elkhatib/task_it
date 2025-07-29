import '../../../../../../core/params/tasks/task_params/reminder/task_reminder_id_params.dart';
import '../../../models/reminder_model.dart';
import '../../base_task_remote_context.dart';

mixin TaskRemindersRemoteImpl on BaseTaskRemoteContext {
  Future<ReminderModel> addTaskReminder(ReminderModel model) {
    // TODO: implement addTaskLabel
    throw UnimplementedError();
  }

  Future<void> removeTaskReminder(TaskReminderIdParams params) {
    // TODO: implement removeTaskLabel
    throw UnimplementedError();
  }
}
