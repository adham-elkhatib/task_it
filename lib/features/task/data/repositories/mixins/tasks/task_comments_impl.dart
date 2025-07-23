import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/task_model.dart';
import '../../base_task_repository_context.dart';

mixin TaskCommentsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addTaskComment({
    required TaskCommentParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addTaskComment(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addTaskComment',
    );
  }

  Future<Either<Failure, TaskEntity>> updateTaskComment({
    required TaskCommentParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.updateTaskComment(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/updateTaskComment',
    );
  }

  Future<Either<Failure, TaskEntity>> deleteTaskComment({
    required TaskCommentIdParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.deleteTaskComment(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/deleteTaskComment',
    );
  }
}
