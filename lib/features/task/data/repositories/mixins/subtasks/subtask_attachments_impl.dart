import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error%20Handling/errors/failure.dart';
import 'package:task_it/core/params/tasks/tasks_params.export.dart';
import 'package:task_it/features/task/domain/entities/subtask_entity.dart';

import '../../../../domain/entities/task_attachment_entity.dart';
import '../../../models/subtask_model.dart';
import '../../../models/task_attachment_model.dart';
import '../../base_task_repository_context.dart';

mixin SubtaskAttachmentsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, SubtaskEntity>> addSubtaskAttachment(
    SubtaskAttachmentParams params,
  ) async {
    return executeRemoteCall<SubtaskModel>(
      remoteCall: () => remoteDataSource.addSubtaskAttachment(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskAttachment/add',
    );
  }

  Future<Either<Failure, AttachmentEntity>> updateSubtaskAttachment(
    SubtaskAttachmentParams params,
  ) async {
    return executeRemoteCall<AttachmentModel>(
      remoteCall: () => remoteDataSource.updateSubtaskAttachment(params),
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
