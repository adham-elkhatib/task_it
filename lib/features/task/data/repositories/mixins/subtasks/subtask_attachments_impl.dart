import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error%20Handling/errors/failure.dart';
import 'package:task_it/core/Services/Id%20Generating/id_generating.service.dart';
import 'package:task_it/core/params/tasks/tasks_params.export.dart';

import '../../../../../../core/params/tasks/subtask_params/attachment/update_subtask_attachment_params.dart';
import '../../../../domain/entities/task_attachment_entity.dart';
import '../../../models/task_attachment_model.dart';
import '../../base_task_repository_context.dart';

mixin SubtaskAttachmentsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, AttachmentEntity>> addSubtaskAttachment(
    CreateSubtaskAttachmentParams params,
  ) async {
    String id = IdGeneratingService.generate();
    AttachmentModel attachment = AttachmentModel(
      id: id,
      name: params.fileName,
      fileUrl: params.fileUrl,
      uploadedBy: currentUserId!,
      uploadedAt: DateTime.now(),
    );
    return executeRemoteCall<AttachmentModel>(
      remoteCall: () => remoteDataSource.addSubtaskAttachment(attachment),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskAttachment/add',
    );
  }

  Future<Either<Failure, AttachmentEntity>> updateSubtaskAttachment(
    UpdateSubtaskAttachmentParams params,
  ) async {
    AttachmentModel attachment = AttachmentModel(
      id: params.id,
      name: params.fileName,
      fileUrl: params.fileUrl,
      uploadedBy: currentUserId!,
      uploadedAt: DateTime.now(),
    );
    return executeRemoteCall<AttachmentModel>(
      remoteCall: () => remoteDataSource.updateSubtaskAttachment(attachment),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskAttachment/update',
    );
  }

  Future<Either<Failure, void>> deleteSubtaskAttachment(
    SubtaskAttachmentIdParams params,
  ) async {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.deleteSubtaskAttachment(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskAttachment/delete',
    );
  }
}
