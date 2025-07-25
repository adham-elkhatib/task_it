import 'package:dartz/dartz.dart';
import 'package:task_it/features/task/domain/entities/reminder_entity.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class AddSubtaskReminderUsecase
    extends UseCase<ReminderEntity, SubtaskReminderParams> {
  final TaskRepository repository;

  AddSubtaskReminderUsecase(this.repository);

  @override
  Future<Either<Failure, ReminderEntity>> call(SubtaskReminderParams params) {
    return repository.addSubtaskReminder(params);
  }
}
