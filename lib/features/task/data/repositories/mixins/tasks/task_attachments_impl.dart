import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/task_model.dart';
import '../../base_task_repository_context.dart';

mixin TaskAttachmentsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addTaskAttachment({
    required TaskAttachmentParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addTaskAttachment(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addTaskAttachment',
    );
  }

  Future<Either<Failure, TaskEntity>> updateTaskAttachment({
    required TaskAttachmentParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.updateTaskAttachment(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/updateTaskAttachment',
    );
  }

  Future<Either<Failure, TaskEntity>> deleteTaskAttachment({
    required TaskAttachmentIdParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.deleteTaskAttachment(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/deleteTaskAttachment',
    );
  }
}
