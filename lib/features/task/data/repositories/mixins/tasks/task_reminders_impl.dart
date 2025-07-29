import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';
import 'package:task_it/core/Services/Id%20Generating/id_generating.service.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/reminder_entity.dart';
import '../../../models/reminder_model.dart';
import '../../base_task_repository_context.dart';

mixin TaskRemindersImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, ReminderEntity>> addTaskReminder(
    TaskReminderParams params,
  ) {
    String id = IdGeneratingService.generate();
    ReminderModel reminderModel = ReminderModel(
      id: id,
      time: params.time,
      repeatType: params.repeatType,
    );
    return executeRemoteCall<ReminderModel>(
      remoteCall: () => remoteDataSource.addTaskReminder(reminderModel),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addTaskReminder',
    );
  }

  Future<Either<Failure, void>> removeTaskReminder(
    TaskReminderIdParams params,
  ) {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.removeTaskReminder(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeTaskReminder',
    );
  }
}
