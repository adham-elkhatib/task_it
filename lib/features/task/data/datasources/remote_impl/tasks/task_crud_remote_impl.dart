import 'package:task_it/core/Services/Id%20Generating/id_generating.service.dart';

import '../../../../../../core/Services/Auth/auth.service.dart';
import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../../../locator.dart';
import '../../../../../project/domain/entities/priority_enum.dart';
import '../../../../../project/domain/entities/status_enum.dart';
import '../../../models/task_model.dart';
import '../../base_task_remote_context.dart';

mixin TaskCrudRemoteImpl on BaseTaskRemoteContext {
  Future<List<TaskModel>> getTasks() async {
    final response = await executeRemoteCall<List<TaskModel>>(
      () => firestoreRepo.readAll(),
    );
    return response;
  }

  Future<TaskModel> createTask(CreateTaskParams params) async {
    final String id = IdGeneratingService.generate();
    final authService = sl<AuthService>();

    final TaskModel taskModel = TaskModel(
      id: id,
      title: params.title,
      projectId: params.projectId,
      assigneeId: userId,
      deadline: params.deadline,
      priority: Priority.values[params.priorityIndex],
      status: TaskStatus.toDo,
      actionItemsIds: const [],
      assigneeName: null,
      assigneePictureUrl: null,
      projectName: null,
    );

    await executeRemoteCall<String>(
      () => firestoreRepo.createSingle(taskModel),
    );

    return taskModel;
  }

  Future<TaskModel> updateTask(UpdateTaskParams params) async {
    final response = await executeRemoteCall(
      () => dio.put('/tasks/${params.taskId}', data: params.toJson()),
    );
    return TaskModel.fromJson(response.data);
  }

  Future<void> deleteTask(TaskIdParams params) async {
    await executeRemoteCall(() => dio.delete('/tasks/${params.taskId}'));
  }
}
