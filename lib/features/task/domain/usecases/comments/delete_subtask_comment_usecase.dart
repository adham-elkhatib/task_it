import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class DeleteSubtaskCommentUsecase
    extends UseCase<void, SubtaskCommentIdParams> {
  final TaskRepository repository;

  DeleteSubtaskCommentUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(SubtaskCommentIdParams params) {
    return repository.deleteSubtaskComment(params);
  }
}
