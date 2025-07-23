import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/features/task/data/models/task_model.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../base_task_repository_context.dart';

mixin SubtaskLabelsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addSubtaskLabel({
    required SubtaskLabelParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addSubtaskLabel(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addSubtaskLabel',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, TaskEntity>> removeSubtaskLabel({
    required SubtaskLabelParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.removeSubtaskLabel(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeSubtaskLabel',
    ).then((result) => result.map((model) => model.toEntity()));
  }
}
