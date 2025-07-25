import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';
import 'package:task_it/features/task/data/models/task_comment_model.dart';
import 'package:task_it/features/task/data/repositories/base_task_repository_context.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/comment_entity.dart';

mixin SubtaskCommentsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, CommentEntity>> addSubtaskComment(
    SubtaskCommentParams params,
  ) async {
    return executeRemoteCall<CommentModel>(
      remoteCall: () => remoteDataSource.addSubtaskComment(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskComment/add',
    );
  }

  Future<Either<Failure, CommentEntity>> updateSubtaskComment(
    SubtaskCommentParams params,
  ) async {
    return executeRemoteCall<CommentModel>(
      remoteCall: () => remoteDataSource.updateSubtaskComment(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskComment/update',
    );
  }

  Future<Either<Failure, void>> deleteSubtaskComment({
    required SubtaskCommentIdParams params,
  }) async {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.deleteSubtaskComment(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'SubtaskComment/delete',
    );
  }
}
