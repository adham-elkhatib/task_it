import 'package:dartz/dartz.dart';
import 'package:task_it/features/task/domain/entities/reminder_entity.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class AddTaskReminderUsecase
    extends UseCase<ReminderEntity, TaskReminderParams> {
  final TaskRepository repository;

  AddTaskReminderUsecase(this.repository);

  @override
  Future<Either<Failure, ReminderEntity>> call(TaskReminderParams params) {
    return repository.addTaskReminder(params);
  }
}
