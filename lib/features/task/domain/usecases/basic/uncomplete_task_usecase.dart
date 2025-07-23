import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../entities/task_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class UncompleteTaskUsecase extends UseCase<TaskEntity, TaskIdParams> {
  final TaskRepository repository;

  UncompleteTaskUsecase(this.repository);

  @override
  Future<Either<Failure, TaskEntity>> call(TaskIdParams params) {
    return repository.unCompleteTask(params: params);
  }
}
