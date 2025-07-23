import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';
import 'package:task_it/features/task/data/repositories/base_task_repository_context.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/subtask_entity.dart';

mixin SubtaskCrudImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, List<SubtaskEntity>>> getSubtasksByTaskId(
    String taskId,
  ) {
    return executeRemoteCall<List<SubtaskEntity>>(
      remoteCall: () => remoteDataSource.getSubtasks(taskId),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'Subtask/add',
    );
  }

  Future<Either<Failure, SubtaskEntity>> addSubtask({
    required SubtaskParams params,
  }) async {
    return executeRemoteCall<SubtaskEntity>(
      remoteCall: () => remoteDataSource.addSubtask(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'Subtask/add',
    );
  }

  Future<Either<Failure, SubtaskEntity>> updateSubtask({
    required SubtaskParams params,
  }) async {
    return executeRemoteCall<SubtaskEntity>(
      remoteCall: () => remoteDataSource.updateSubtask(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'Subtask/update',
    );
  }

  Future<Either<Failure, void>> deleteSubtask({
    required SubtaskIdParams params,
  }) async {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.deleteSubtask(params),
      onSuccess: (task) => localDataSource.removeSubtask(params.subtaskId),
      location: 'Subtask/delete',
    );
  }
}
