import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class RemoveTaskReminderUsecase extends UseCase<void, TaskReminderParams> {
  final TaskRepository repository;

  RemoveTaskReminderUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(TaskReminderParams params) {
    return repository.removeTaskReminder(params);
  }
}
