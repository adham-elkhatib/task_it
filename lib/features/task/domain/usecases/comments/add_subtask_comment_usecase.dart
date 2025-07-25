import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/subtask_params/subtask_comment_params.dart';
import '../../entities/comment_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class AddSubtaskCommentUsecase
    extends UseCase<CommentEntity, SubtaskCommentParams> {
  final TaskRepository repository;

  AddSubtaskCommentUsecase(this.repository);

  @override
  Future<Either<Failure, CommentEntity>> call(SubtaskCommentParams params) {
    return repository.addSubtaskComment(params);
  }
}
