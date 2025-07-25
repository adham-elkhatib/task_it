import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/task_model.dart';
import '../../base_task_remote_context.dart';

mixin TaskTagsRemoteImpl on BaseTaskRemoteContext {
  Future<TaskModel> addTaskTag(TaskTagParams params) {
    // TODO: implement removeTaskLabel
    throw UnimplementedError();
  }

  Future<TaskModel> removeTaskTag(TaskTagParams task) {
    // TODO: implement addTaskLabel
    throw UnimplementedError();
  }
}
