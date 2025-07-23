import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/features/task/data/models/task_model.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../base_task_repository_context.dart';

mixin TaskChecklistImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addChecklist({
    required TaskChecklistParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addChecklist(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addChecklist',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, TaskEntity>> updateChecklist({
    required TaskChecklistParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.updateChecklist(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/updateChecklist',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, TaskEntity>> deleteChecklist({
    required TaskChecklistIdParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.deleteChecklist(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/deleteChecklist',
    ).then((result) => result.map((model) => model.toEntity()));
  }
}
