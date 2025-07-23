import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/features/task/data/models/task_model.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../base_task_repository_context.dart';

mixin SubtaskAssigneesImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addSubtaskAssignee({
    required SubtaskAssigneeParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addSubtaskAssignee(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addSubtaskAssignee',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, TaskEntity>> removeSubtaskAssignee({
    required SubtaskAssigneeParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.removeSubtaskAssignee(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeSubtaskAssignee',
    ).then((result) => result.map((model) => model.toEntity()));
  }
}
