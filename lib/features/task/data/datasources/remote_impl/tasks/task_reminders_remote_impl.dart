import '../../../../../../core/params/tasks/task_params/reminder/task_reminder_id_params.dart';
import '../../../models/reminder_model.dart';
import '../../../models/task_model.dart';
import '../../base_task_remote_context.dart';

mixin TaskRemindersRemoteImpl on BaseTaskRemoteContext {
  Future<TaskModel> addTaskReminder(ReminderModel params) {
    // TODO: implement addTaskLabel
    throw UnimplementedError();
  }

  Future<TaskModel> removeTaskReminder(TaskReminderIdParams params) {
    // TODO: implement removeTaskLabel
    throw UnimplementedError();
  }
}
