import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class DeleteSubtaskAttachmentUsecase
    extends UseCase<void, SubtaskAttachmentIdParams> {
  final TaskRepository repository;

  DeleteSubtaskAttachmentUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(SubtaskAttachmentIdParams params) {
    return repository.deleteSubtaskAttachment(params);
  }
}
