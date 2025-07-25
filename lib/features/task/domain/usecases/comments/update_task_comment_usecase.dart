import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../entities/comment_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class UpdateTaskCommentUsecase
    extends UseCase<CommentEntity, TaskCommentParams> {
  final TaskRepository repository;

  UpdateTaskCommentUsecase(this.repository);

  @override
  Future<Either<Failure, CommentEntity>> call(TaskCommentParams params) {
    return repository.updateTaskComment(params);
  }
}
