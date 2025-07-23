import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../entities/task_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class AddTaskAttachmentUsecase
    extends UseCase<TaskEntity, TaskAttachmentParams> {
  final TaskRepository repository;

  AddTaskAttachmentUsecase(this.repository);

  @override
  Future<Either<Failure, TaskEntity>> call(TaskAttachmentParams params) {
    return repository.addTaskAttachment(params: params);
  }
}
