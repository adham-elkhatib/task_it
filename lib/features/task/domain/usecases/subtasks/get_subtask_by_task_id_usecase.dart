import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/subtask_params/crud/subtask_id_params.dart';
import '../../entities/subtask_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class GetSubtaskByTaskIdUsecase
    extends UseCase<List<SubtaskEntity>, SubtaskIdParams> {
  final TaskRepository repository;

  GetSubtaskByTaskIdUsecase(this.repository);

  @override
  Future<Either<Failure, List<SubtaskEntity>>> call(SubtaskIdParams params) {
    return repository.getSubtasksByTaskId(params);
  }
}
