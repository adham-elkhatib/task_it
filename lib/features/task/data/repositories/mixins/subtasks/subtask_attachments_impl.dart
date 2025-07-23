import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error%20Handling/errors/failure.dart';
import 'package:task_it/core/params/tasks/tasks_params.export.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../models/task_model.dart';
import '../../base_task_repository_context.dart';

mixin SubtaskAttachmentsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addSubtaskAttachment({
    required SubtaskAttachmentParams params,
  }) async {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addSubtaskAttachment(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskAttachment/add',
    );
  }

  Future<Either<Failure, TaskEntity>> updateSubtaskAttachment({
    required SubtaskAttachmentParams params,
  }) async {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.updateSubtaskAttachment(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskAttachment/update',
    );
  }

  Future<Either<Failure, TaskEntity>> deleteSubtaskAttachment({
    required SubtaskAttachmentIdParams params,
  }) async {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.deleteSubtaskAttachment(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskAttachment/delete',
    );
  }
}
