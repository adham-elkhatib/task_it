import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/core/Services/Id%20Generating/id_generating.service.dart';
import 'package:task_it/core/params/tasks/tasks_params.export.dart';
import 'package:task_it/features/task/data/models/task_model.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../base_task_repository_context.dart';

mixin TaskCrudImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> createTask({
    required CreateTaskParams params,
  }) {
    String taskId = IdGeneratingService.generate();
    TaskModel task = TaskModel(
      id: taskId,
      title: params.title,
      projectId: params.projectId,
      priority: params.priority,
      deadline: params.deadline,
      actionItemsIds: const [],
      assigneeIds: params.assigneeId,
      taskStatus: params.taskStatus,
    );
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.createTask(task),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/createTask',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, TaskEntity>> updateTask(UpdateTaskParams params) {
    TaskModel task = TaskModel(
      id: params.taskId,
      title: params.title!,
      priority: params.priority,
      deadline: params.deadline,
      assigneeIds: params.assigneeIds,
      taskStatus: params.taskStatus,
    );
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.updateTask(task),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/updateTask',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, void>> deleteTask({required TaskIdParams params}) {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.deleteTask(params.taskId),
      onSuccess: (_) => localDataSource.deleteTask(params.taskId),
      location: 'TaskRepo/deleteTask',
    );
  }

  Future<Either<Failure, TaskEntity>> getTask({required GetTaskParams params}) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.getTask(params.taskId),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/getTask',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, List<TaskEntity>>> getTasksByProjectId(
    ProjectIdParams params,
  ) {
    return executeRemoteCall<List<TaskModel>>(
      remoteCall: () => remoteDataSource.getTasksByProjectId(params.projectId),
      location: 'TaskRepo/getTasksByProjectId',
    ).then(
      (result) =>
          result.map((models) => models.map((e) => e.toEntity()).toList()),
    );
  }

  Future<Either<Failure, List<TaskEntity>>> getTasksByUserId(
    UserIdParams params,
  ) {
    return executeRemoteCall<List<TaskModel>>(
      remoteCall: () => remoteDataSource.getTasksByUserId(params.userId),
      location: 'TaskRepo/getTasksByUserId',
    ).then(
      (result) =>
          result.map((models) => models.map((e) => e.toEntity()).toList()),
    );
  }

  Future<Either<Failure, TaskEntity>> completeTask(TaskIdParams params) {
    TaskModel task = TaskModel(id: params.taskId, isCompleted: true);
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.completeTask(task),

      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/completeTask',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, TaskEntity>> unCompleteTask(TaskIdParams params) {
    TaskModel task = TaskModel(id: params.taskId, isCompleted: false);

    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.unCompleteTask(task),

      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/unCompleteTask',
    ).then((result) => result.map((model) => model.toEntity()));
  }
}
