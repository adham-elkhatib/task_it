import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/features/task/data/models/task_model.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../base_task_repository_context.dart';

mixin TaskAssigneesImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addTaskAssignee({
    required TaskAssigneeParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addTaskAssignee(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addTaskAssignee',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, TaskEntity>> removeTaskAssignee({
    required TaskAssigneeParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.removeTaskAssignee(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeTaskAssignee',
    ).then((result) => result.map((model) => model.toEntity()));
  }
}
