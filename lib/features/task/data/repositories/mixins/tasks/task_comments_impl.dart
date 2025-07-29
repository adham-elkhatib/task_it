import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';

import '../../../../../../core/Services/Id Generating/id_generating.service.dart';
import '../../../../../../core/params/tasks/task_params/comment/update_task_comment_params.dart';
import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/comment_entity.dart';
import '../../../models/task_comment_model.dart';
import '../../base_task_repository_context.dart';

mixin TaskCommentsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, CommentEntity>> addTaskComment(
    CreateTaskCommentParams params,
  ) {
    String? id = IdGeneratingService.generate();
    CommentModel comment = CommentModel(
      id: id,
      content: params.content,
      userId: currentUserId ?? "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return executeRemoteCall<CommentModel>(
      remoteCall: () => remoteDataSource.addTaskComment(comment),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addTaskComment',
    );
  }

  Future<Either<Failure, CommentEntity>> updateTaskComment(
    UpdateTaskCommentParams params,
  ) {
    CommentModel comment = CommentModel(
      id: params.commentId,
      content: params.content,
      userId: currentUserId ?? "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return executeRemoteCall<CommentModel>(
      remoteCall: () => remoteDataSource.updateTaskComment(comment),
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
