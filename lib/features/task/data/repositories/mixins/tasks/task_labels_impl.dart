import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/task_model.dart';
import '../../base_task_repository_context.dart';

mixin TaskLabelsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addTaskLabel({
    required TaskLabelParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addTaskLabel(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addTaskLabel',
    );
  }

  Future<Either<Failure, TaskEntity>> removeTaskLabel({
    required TaskLabelParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.removeTaskLabel(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeTaskLabel',
    );
  }
}
