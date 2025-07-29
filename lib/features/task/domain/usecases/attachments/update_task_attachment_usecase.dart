import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/task_params/attachment/update_task_attachment_params.dart';
import '../../entities/task_attachment_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class UpdateTaskAttachmentUsecase
    extends UseCase<AttachmentEntity, UpdateTaskAttachmentParams> {
  final TaskRepository repository;

  UpdateTaskAttachmentUsecase(this.repository);

  @override
  Future<Either<Failure, AttachmentEntity>> call(
    UpdateTaskAttachmentParams params,
  ) {
    return repository.updateTaskAttachment(params);
  }
}
