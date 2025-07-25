import '../../../models/task_model.dart';
import '../../base_task_remote_context.dart';

mixin TaskCrudRemoteImpl on BaseTaskRemoteContext {
  Future<TaskModel> getTask(String taskId) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  Future<List<TaskModel>> getTasks() async {
    final response = await executeRemoteCall<List<TaskModel>>(
      () => taskRepo.readAll(),
    );
    return response;
  }

  Future<List<TaskModel>> getTasksByProjectId(String projectId) {
    // TODO: implement getTasksByProjectId
    throw UnimplementedError();
  }

  Future<List<TaskModel>> getTasksByUserId(String userId) {
    // TODO: implement getTasksByUserId
    throw UnimplementedError();
  }

  Future<TaskModel> createTask(TaskModel task) async {
    await executeRemoteCall<String>(() => taskRepo.createSingle(task));
    return task;
  }

  Future<void> deleteTask(String taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  Future<TaskModel> updateTask(TaskModel task) {
    // TODO: implement updateTask
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
