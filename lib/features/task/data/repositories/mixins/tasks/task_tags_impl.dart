import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/task_model.dart';
import '../../base_task_repository_context.dart';

mixin TaskTagsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addTaskTag({
    required TaskTagParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addTaskTag(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addTaskTag',
    );
  }

  Future<Either<Failure, TaskEntity>> removeTaskTag({
    required TaskTagParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.removeTaskTag(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeTaskTag',
    );
  }
}
