import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/subtask_model.dart';
import '../../base_task_remote_context.dart';

mixin SubtaskCrudRemoteImpl on BaseTaskRemoteContext {
  Future<List<SubtaskModel>> getSubtasksByTaskId(SubtaskIdParams taskId) {
    // TODO: implement getSubtasks
    throw UnimplementedError();
  }

  Future<SubtaskModel> addSubtask(SubtaskModel params) {
    // TODO: implement addSubtask
    throw UnimplementedError();
  }

  Future<SubtaskModel> updateSubtask(SubtaskModel params) {
    // TODO: implement updateSubtask
    throw UnimplementedError();
  }

  Future<void> deleteSubtask(SubtaskIdParams params) {
    // TODO: implement deleteSubtask
    throw UnimplementedError();
  }
}
