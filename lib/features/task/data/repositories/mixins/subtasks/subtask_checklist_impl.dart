import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/features/task/data/models/task_model.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../base_task_repository_context.dart';

mixin SubtaskChecklistImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addSubtaskChecklist({
    required SubtaskChecklistParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addSubtaskChecklist(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addSubtaskChecklist',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, TaskEntity>> updateSubtaskChecklist({
    required SubtaskChecklistParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.updateSubtaskChecklist(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/updateSubtaskChecklist',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, TaskEntity>> deleteSubtaskChecklist({
    required SubtaskChecklistIdParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.deleteSubtaskChecklist(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/deleteSubtaskChecklist',
    ).then((result) => result.map((model) => model.toEntity()));
  }
}
