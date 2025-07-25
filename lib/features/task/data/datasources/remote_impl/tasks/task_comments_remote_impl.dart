import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/task_model.dart';
import '../../base_task_remote_context.dart';

mixin TaskCommentsRemoteImpl on BaseTaskRemoteContext {
  Future<TaskModel> addTaskLabel(TaskLabelParams params) {
    // TODO: implement addTaskLabel
    throw UnimplementedError();
  }

  Future<TaskModel> removeTaskLabel(TaskLabelParams params) {
    // TODO: implement removeTaskLabel
    throw UnimplementedError();
  }
}
