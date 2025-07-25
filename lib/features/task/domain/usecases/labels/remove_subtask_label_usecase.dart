import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class RemoveSubtaskLabelUsecase extends UseCase<void, SubtaskLabelParams> {
  final TaskRepository repository;

  RemoveSubtaskLabelUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(SubtaskLabelParams params) {
    return repository.removeSubtaskLabel(params);
  }
}
