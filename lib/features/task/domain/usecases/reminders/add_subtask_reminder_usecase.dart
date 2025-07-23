import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../entities/task_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class AddSubtaskReminderUsecase
    extends UseCase<TaskEntity, SubtaskReminderParams> {
  final TaskRepository repository;

  AddSubtaskReminderUsecase(this.repository);

  @override
  Future<Either<Failure, TaskEntity>> call(SubtaskReminderParams params) {
    return repository.addSubtaskReminder(params: params);
  }
}
