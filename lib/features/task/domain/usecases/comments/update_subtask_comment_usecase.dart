import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/subtask_params/comment/update_subtask_comment_params.dart';
import '../../entities/comment_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class UpdateSubtaskCommentUsecase
    extends UseCase<CommentEntity, UpdateSubtaskCommentParams> {
  final TaskRepository repository;

  UpdateSubtaskCommentUsecase(this.repository);

  @override
  Future<Either<Failure, CommentEntity>> call(
    UpdateSubtaskCommentParams params,
  ) {
    return repository.updateSubtaskComment(params);
  }
}
