import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../entities/subtask_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class UpdateSubtaskUsecase extends UseCase<SubtaskEntity, SubtaskParams> {
  final TaskRepository repository;

  UpdateSubtaskUsecase(this.repository);

  @override
  Future<Either<Failure, SubtaskEntity>> call(SubtaskParams params) {
    return repository.updateSubtask(params: params);
  }
}
