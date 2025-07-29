import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';
import 'package:task_it/core/Services/Id%20Generating/id_generating.service.dart';

import '../../../../../../core/params/tasks/task_params/attachment/update_task_attachment_params.dart';
import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/task_attachment_entity.dart';
import '../../../models/task_attachment_model.dart';
import '../../base_task_repository_context.dart';

mixin TaskAttachmentsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, AttachmentEntity>> addTaskAttachment(
    CreateTaskAttachmentParams params,
  ) {
    String id = IdGeneratingService.generate();
    // todo implement name + fileUrl
    AttachmentModel attachmentModel = AttachmentModel(
      id: id,
      fileUrl: "test",
      name: "test",
      uploadedAt: DateTime.now(),
      uploadedBy: currentUserId!,
    );

    return executeRemoteCall<AttachmentModel>(
      remoteCall: () => remoteDataSource.addTaskAttachment(attachmentModel),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addTaskAttachment',
    );
  }

  Future<Either<Failure, AttachmentEntity>> updateTaskAttachment(
    UpdateTaskAttachmentParams params,
  ) {
    // todo implement name + fileUrl
    AttachmentModel attachmentModel = AttachmentModel(
      id: params.attachmentId,
      fileUrl: "test",
      name: "test",
      uploadedAt: DateTime.now(),
      uploadedBy: currentUserId!,
    );

    return executeRemoteCall<AttachmentModel>(
      remoteCall: () => remoteDataSource.updateTaskAttachment(attachmentModel),
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
