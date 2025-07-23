import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/features/task/data/models/task_model.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../base_task_repository_context.dart';

mixin SubtaskTagsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addSubtaskTag({
    required SubtaskTagParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addSubtaskTag(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addSubtaskTag',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, TaskEntity>> removeSubtaskTag({
    required SubtaskTagParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.removeSubtaskTag(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeSubtaskTag',
    ).then((result) => result.map((model) => model.toEntity()));
  }
}
