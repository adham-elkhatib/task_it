import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/features/task/data/models/task_model.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../../project/domain/entities/priority_enum.dart';
import '../../../../../project/domain/entities/status_enum.dart';
import '../../base_task_repository_context.dart';

mixin TaskAssigneesImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addTaskAssignee(
    TaskAssigneeParams params,
  ) {
    // todo add params

    TaskModel task = TaskModel(
      id: params.taskId,
      title: "params.title",
      projectId: "params.projectId",
      spaceId: params.spaceId,
      priority: Priority.values[0],
      deadline: DateTime.now(),
      assigneeIds: [],
      taskStatus: TaskStatus.values[0],
    );
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addTaskAssignee(task),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addTaskAssignee',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, TaskEntity>> removeTaskAssignee(
    TaskAssigneeParams params,
  ) {
    // todo add params
    TaskModel task = TaskModel(
      id: params.taskId,
      title: "params.title",
      projectId: "params.projectId",
      priority: Priority.values[0],
      deadline: DateTime.now(),
      assigneeIds: [],
      taskStatus: TaskStatus.values[0],
    );
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.removeTaskAssignee(task),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeTaskAssignee',
    ).then((result) => result.map((model) => model.toEntity()));
  }
}
