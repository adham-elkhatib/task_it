import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../entities/task_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class GetTasksByUserIdUsecase extends UseCase<List<TaskEntity>, UserIdParams> {
  final TaskRepository repository;

  GetTasksByUserIdUsecase(this.repository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(UserIdParams params) {
    return repository.getTasksByUserId(params);
  }
}
