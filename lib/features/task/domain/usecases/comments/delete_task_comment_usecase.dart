import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class DeleteTaskCommentUsecase extends UseCase<void, TaskCommentIdParams> {
  final TaskRepository repository;

  DeleteTaskCommentUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(TaskCommentIdParams params) {
    return repository.deleteTaskComment(params);
  }
}
