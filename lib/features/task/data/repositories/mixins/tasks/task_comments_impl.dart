import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/comment_entity.dart';
import '../../../models/task_comment_model.dart';
import '../../base_task_repository_context.dart';

mixin TaskCommentsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, CommentEntity>> addTaskComment(
    TaskCommentParams params,
  ) {
    return executeRemoteCall<CommentModel>(
      remoteCall: () => remoteDataSource.addTaskComment(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addTaskComment',
    );
  }

  Future<Either<Failure, CommentEntity>> updateTaskComment(
    TaskCommentParams params,
  ) {
    return executeRemoteCall<CommentModel>(
      remoteCall: () => remoteDataSource.updateTaskComment(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/updateTaskComment',
    );
  }

  Future<Either<Failure, void>> deleteTaskComment(TaskCommentIdParams params) {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.deleteTaskComment(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/deleteTaskComment',
    );
  }
}
