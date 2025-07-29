import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/core/Services/Id%20Generating/id_generating.service.dart';
import 'package:task_it/features/task/data/models/reminder_model.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/reminder_entity.dart';
import '../../base_task_repository_context.dart';

mixin SubtaskRemindersImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, ReminderEntity>> addSubtaskReminder(
    SubtaskReminderParams params,
  ) {
    String id = IdGeneratingService.generate();
    ReminderModel reminder = ReminderModel(
      id: id,
      time: params.time,
      repeatType: ReminderRepeatType.values[params.repeatType],
    );
    return executeRemoteCall<ReminderModel>(
      remoteCall: () => remoteDataSource.addSubtaskReminder(reminder),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addSubtaskReminder',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, void>> removeSubtaskReminder(
    SubtaskReminderParams params,
  ) {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.removeSubtaskReminder(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeSubtaskReminder',
    );
  }
}
