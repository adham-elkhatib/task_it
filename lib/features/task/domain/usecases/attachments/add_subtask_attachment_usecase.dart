import 'package:dartz/dartz.dart';
import 'package:task_it/features/task/domain/entities/task_attachment_entity.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class AddSubtaskAttachmentUsecase
    extends UseCase<AttachmentEntity, CreateSubtaskAttachmentParams> {
  final TaskRepository repository;

  AddSubtaskAttachmentUsecase(this.repository);

  @override
  Future<Either<Failure, AttachmentEntity>> call(
    CreateSubtaskAttachmentParams params,
  ) {
    return repository.addSubtaskAttachment(params);
  }
}
