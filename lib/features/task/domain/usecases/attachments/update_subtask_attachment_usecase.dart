import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../entities/task_attachment_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class UpdateSubtaskAttachmentUsecase
    extends UseCase<AttachmentEntity, SubtaskAttachmentParams> {
  final TaskRepository repository;

  UpdateSubtaskAttachmentUsecase(this.repository);

  @override
  Future<Either<Failure, AttachmentEntity>> call(
    SubtaskAttachmentParams params,
  ) {
    return repository.updateSubtaskAttachment(params);
  }
}
