import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class RemoveSubtaskReminderUsecase
    extends UseCase<void, SubtaskReminderParams> {
  final TaskRepository repository;

  RemoveSubtaskReminderUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(SubtaskReminderParams params) {
    return repository.removeSubtaskReminder(params);
  }
}
