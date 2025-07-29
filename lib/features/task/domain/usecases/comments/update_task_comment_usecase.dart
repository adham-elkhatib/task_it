import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/task_params/comment/update_task_comment_params.dart';
import '../../entities/comment_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class UpdateTaskCommentUsecase
    extends UseCase<CommentEntity, UpdateTaskCommentParams> {
  final TaskRepository repository;

  UpdateTaskCommentUsecase(this.repository);

  @override
  Future<Either<Failure, CommentEntity>> call(UpdateTaskCommentParams params) {
    return repository.updateTaskComment(params);
  }
}
