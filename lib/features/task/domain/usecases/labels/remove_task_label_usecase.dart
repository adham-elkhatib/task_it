import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/task_params/label/task_label_id_params.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class RemoveTaskLabelUsecase extends UseCase<void, TaskLabelIdParams> {
  final TaskRepository repository;

  RemoveTaskLabelUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(TaskLabelIdParams params) {
    return repository.removeTaskLabel(params);
  }
}
