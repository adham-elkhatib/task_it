import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/task_model.dart';
import '../../base_task_remote_context.dart';

mixin TaskCrudRemoteImpl on BaseTaskRemoteContext {
  Future<TaskModel> getTask(GetTaskParams taskId) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  Future<List<TaskModel>> getTasksByProjectId(ProjectIdParams projectId) {
    // TODO: implement getTasksByProjectId
    throw UnimplementedError();
  }

  Future<List<TaskModel>> getTasksByUserId(UserIdParams userId) {
    // TODO: implement getTasksByUserId
    throw UnimplementedError();
  }

  Future<TaskModel> createTask(TaskModel task) async {
    await executeRemoteCall<String>(() => taskRepo.createSingle(task));
    return task;
  }

  Future<TaskModel> updateTask(TaskModel task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }

  Future<void> deleteTask(TaskIdParams taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  Future<TaskModel> completeTask(TaskModel task) {
    // TODO: implement completeTask
    throw UnimplementedError();
  }

  Future<TaskModel> unCompleteTask(TaskModel task) {
    // TODO: implement unCompleteTask
    throw UnimplementedError();
  }
}
