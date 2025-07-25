import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class RemoveTaskLabelUsecase extends UseCase<void, TaskLabelParams> {
  final TaskRepository repository;

  RemoveTaskLabelUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(TaskLabelParams params) {
    return repository.removeTaskLabel(params);
  }
}
