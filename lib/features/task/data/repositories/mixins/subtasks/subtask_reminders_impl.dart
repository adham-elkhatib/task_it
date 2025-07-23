import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/features/task/data/models/task_model.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../base_task_repository_context.dart';

mixin SubtaskRemindersImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addSubtaskReminder({
    required SubtaskReminderParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addSubtaskReminder(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addSubtaskReminder',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, TaskEntity>> removeSubtaskReminder({
    required SubtaskReminderParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.removeSubtaskReminder(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeSubtaskReminder',
    ).then((result) => result.map((model) => model.toEntity()));
  }
}
