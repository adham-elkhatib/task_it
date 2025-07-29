import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';
import 'package:task_it/features/task/data/models/task_comment_model.dart';
import 'package:task_it/features/task/data/repositories/base_task_repository_context.dart';

import '../../../../../../core/Services/Id Generating/id_generating.service.dart';
import '../../../../../../core/params/tasks/subtask_params/comment/update_subtask_comment_params.dart';
import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/comment_entity.dart';

mixin SubtaskCommentsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, CommentEntity>> addSubtaskComment(
    CreateSubtaskCommentParams params,
  ) async {
    String id = IdGeneratingService.generate();
    CommentModel comment = CommentModel(
      id: id,
      content: params.content,
      createdAt: DateTime.now(),
      userId: currentUserId!,
      updatedAt: DateTime.now(),
    );
    return executeRemoteCall<CommentModel>(
      remoteCall: () => remoteDataSource.addSubtaskComment(comment),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskComment/add',
    );
  }

  Future<Either<Failure, CommentEntity>> updateSubtaskComment(
    UpdateSubtaskCommentParams params,
  ) async {
    CommentModel comment = CommentModel(
      id: params.commentId,
      content: params.content,
      createdAt: DateTime.now(),
      userId: currentUserId!,
      updatedAt: DateTime.now(),
    );
    return executeRemoteCall<CommentModel>(
      remoteCall: () => remoteDataSource.updateSubtaskComment(comment),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskComment/update',
    );
  }

  Future<Either<Failure, void>> deleteSubtaskComment(
    SubtaskCommentIdParams params,
  ) async {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.deleteSubtaskComment(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskComment/delete',
    );
  }
}
