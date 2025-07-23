import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class DeleteTaskUsecase extends UseCase<void, TaskIdParams> {
  final TaskRepository repository;

  DeleteTaskUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(TaskIdParams params) {
    return repository.deleteTask(params: params);
  }
}
