import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class DeleteSubtaskUsecase extends UseCase<void, SubtaskIdParams> {
  final TaskRepository repository;

  DeleteSubtaskUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(SubtaskIdParams params) {
    return repository.deleteSubtask(params: params);
  }
}
