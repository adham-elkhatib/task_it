import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/core/connection/network_info.dart';
import 'package:task_it/features/task/data/datasources/remote_impl/task_remote_data_source.dart';
import 'package:task_it/features/task/data/datasources/task_local_data_source.dart';
import 'package:task_it/features/task/domain/repositories/task_repository.dart';

import '../../../../core/Services/Auth/auth.service.dart';
import 'base_task_repository_context.dart';
import 'mixins/subtasks/subtask_assignees_impl.dart';
import 'mixins/subtasks/subtask_attachments_impl.dart';
import 'mixins/subtasks/subtask_checklist_impl.dart';
import 'mixins/subtasks/subtask_comments_impl.dart';
import 'mixins/subtasks/subtask_crud_impl.dart';
import 'mixins/subtasks/subtask_labels_impl.dart';
import 'mixins/subtasks/subtask_reminders_impl.dart';
import 'mixins/subtasks/subtask_tags_impl.dart';
import 'mixins/tasks/task_assignees_impl.dart';
import 'mixins/tasks/task_attachments_impl.dart';
import 'mixins/tasks/task_checklist_impl.dart';
import 'mixins/tasks/task_comments_impl.dart';
import 'mixins/tasks/task_crud_impl.dart';
import 'mixins/tasks/task_labels_impl.dart';
import 'mixins/tasks/task_reminders_impl.dart';
import 'mixins/tasks/task_tags_impl.dart';

class TaskRepositoryImpl extends BaseTaskRepositoryContext
    with
        // Main Task CRUD + metadata
        TaskCrudImpl,
        TaskAssigneesImpl,
        TaskTagsImpl,
        TaskChecklistImpl,
        TaskLabelsImpl,
        TaskRemindersImpl,
        TaskAttachmentsImpl,
        TaskCommentsImpl,
        // Subtasks core & metadata
        SubtaskCrudImpl,
        SubtaskAssigneesImpl,
        SubtaskTagsImpl,
        SubtaskChecklistImpl,
        SubtaskLabelsImpl,
        SubtaskRemindersImpl,
        SubtaskAttachmentsImpl,
        SubtaskCommentsImpl
    implements TaskRepository {
  TaskRepositoryImpl({
    required AuthService authService,
    required NetworkInfo networkInfo,
    required TaskRemoteDataSource remoteDataSource,
    required TaskLocalDataSource localDataSource,
  }) : super(
         networkInfo: networkInfo,
         authService: authService,
         remoteDataSource: remoteDataSource,
         localDataSource: localDataSource,
       );

  @override
  Future<Either<Failure, T>> executeRemoteCall<T>({
    required Future<T> Function() remoteCall,
    Future<void> Function(T result)? onSuccess,
    String location = '',
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final T result = await remoteCall();
        if (onSuccess != null) await onSuccess(result);
        return Right(result);
      } catch (e, s) {
        final failure = ErrorHandlingService.handle(e, s, location: location);
        return Left(failure);
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }
}
