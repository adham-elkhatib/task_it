import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/subtask_params/attachment/update_subtask_attachment_params.dart';
import '../../entities/task_attachment_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class UpdateSubtaskAttachmentUsecase
    extends UseCase<AttachmentEntity, UpdateSubtaskAttachmentParams> {
  final TaskRepository repository;

  UpdateSubtaskAttachmentUsecase(this.repository);

  @override
  Future<Either<Failure, AttachmentEntity>> call(
    UpdateSubtaskAttachmentParams params,
  ) {
    return repository.updateSubtaskAttachment(params);
  }
}
