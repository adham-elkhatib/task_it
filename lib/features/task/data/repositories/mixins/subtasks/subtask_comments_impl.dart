import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';
import 'package:task_it/features/task/data/repositories/base_task_repository_context.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/task_model.dart';

mixin SubtaskCommentsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addSubtaskComment({
    required SubtaskCommentParams params,
  }) async {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addSubtaskComment(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskComment/add',
    );
  }

  Future<Either<Failure, TaskEntity>> updateSubtaskComment({
    required SubtaskCommentParams params,
  }) async {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.updateSubtaskComment(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskComment/update',
    );
  }

  Future<Either<Failure, TaskEntity>> deleteSubtaskComment({
    required SubtaskCommentIdParams params,
  }) async {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.deleteSubtaskComment(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskComment/delete',
    );
  }
}
