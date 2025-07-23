import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/task_model.dart';
import '../../base_task_repository_context.dart';

mixin TaskRemindersImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TaskEntity>> addTaskReminder({
    required TaskReminderParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.addTaskReminder(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addTaskReminder',
    );
  }

  Future<Either<Failure, TaskEntity>> removeTaskReminder({
    required TaskReminderParams params,
  }) {
    return executeRemoteCall<TaskModel>(
      remoteCall: () => remoteDataSource.removeTaskReminder(params),
      onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeTaskReminder',
    );
  }
}
