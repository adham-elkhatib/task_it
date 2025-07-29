import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/subtask_params/label/subtask_label_id_params.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class RemoveSubtaskLabelUsecase extends UseCase<void, SubtaskLabelIdParams> {
  final TaskRepository repository;

  RemoveSubtaskLabelUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(SubtaskLabelIdParams params) {
    return repository.removeSubtaskLabel(params);
  }
}
