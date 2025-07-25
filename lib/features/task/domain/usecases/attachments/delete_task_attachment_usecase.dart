import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class DeleteTaskAttachmentUsecase
    extends UseCase<void, TaskAttachmentIdParams> {
  final TaskRepository repository;

  DeleteTaskAttachmentUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(TaskAttachmentIdParams params) {
    return repository.deleteTaskAttachment(params);
  }
}
