import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/task_attachment_entity.dart';
import '../../../models/task_attachment_model.dart';
import '../../base_task_repository_context.dart';

mixin TaskAttachmentsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, AttachmentEntity>> addTaskAttachment(
    TaskAttachmentParams params,
  ) {
    return executeRemoteCall<AttachmentModel>(
      remoteCall: () => remoteDataSource.addTaskAttachment(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addTaskAttachment',
    );
  }

  Future<Either<Failure, AttachmentEntity>> updateTaskAttachment(
    TaskAttachmentParams params,
  ) {
    return executeRemoteCall<AttachmentModel>(
      remoteCall: () => remoteDataSource.updateTaskAttachment(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/updateTaskAttachment',
    );
  }

  Future<Either<Failure, void>> deleteTaskAttachment(
    TaskAttachmentIdParams params,
  ) {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.deleteTaskAttachment(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/deleteTaskAttachment',
    );
  }
}
