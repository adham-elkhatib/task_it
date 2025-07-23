import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/core/params/tasks/tasks_params.export.dart';
import 'package:task_it/features/task/data/models/task_model.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../base_task_repository_context.dart';

mixin TaskCrudImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> createTask({
    required CreateTaskParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.createTask(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/createTask',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, TaskEntity>> updateTask({
    required UpdateTaskParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.updateTask(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/updateTask',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, void>> deleteTask({required TaskIdParams params}) {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.deleteTask(params),
      onSuccess: (_) => localDataSource.deleteTask(params.taskId),
      location: 'TaskRepo/deleteTask',
    );
  }

  Future<Either<Failure, TaskEntity>> getTask({required GetTaskParams params}) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.getTask(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/getTask',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, List<TaskEntity>>> getTasksByProjectId({
    required ProjectIdParams params,
  }) {
    return executeRemoteCall<List<TaskModel>>(
      remoteCall: () => remoteDataSource.getTasksByProjectId(params),
      location: 'TaskRepo/getTasksByProjectId',
    ).then(
      (result) =>
          result.map((models) => models.map((e) => e.toEntity()).toList()),
    );
  }

  Future<Either<Failure, List<TaskEntity>>> getTasksByUserId({
    required UserIdParams params,
  }) {
    return executeRemoteCall<List<TaskModel>>(
      remoteCall: () => remoteDataSource.getTasksByUserId(params),
      location: 'TaskRepo/getTasksByUserId',
    ).then(
      (result) =>
          result.map((models) => models.map((e) => e.toEntity()).toList()),
    );
  }

  Future<Either<Failure, TaskEntity>> completeTask({
    required TaskIdParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.completeTask(params),
      onSuccess: (task) => localDataSource.cacheTask(task),

      location: 'TaskRepo/completeTask',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, TaskEntity>> unCompleteTask({
    required TaskIdParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.unCompleteTask(params),
      onSuccess: (task) => localDataSource.cacheTask(task),

      location: 'TaskRepo/unCompleteTask',
    ).then((result) => result.map((model) => model.toEntity()));
  }
}
