import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../entities/task_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class CreateTaskUsecase extends UseCase<TaskEntity, CreateTaskParams> {
  final TaskRepository repository;

  CreateTaskUsecase(this.repository);

  @override
  Future<Either<Failure, TaskEntity>> call(CreateTaskParams params) {
    return repository.createTask(params);
  }
}
