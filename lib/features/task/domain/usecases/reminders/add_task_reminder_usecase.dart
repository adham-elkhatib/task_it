import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../entities/task_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class AddTaskReminderUsecase extends UseCase<TaskEntity, TaskReminderParams> {
  final TaskRepository repository;

  AddTaskReminderUsecase(this.repository);

  @override
  Future<Either<Failure, TaskEntity>> call(TaskReminderParams params) {
    return repository.addTaskReminder(params: params);
  }
}
