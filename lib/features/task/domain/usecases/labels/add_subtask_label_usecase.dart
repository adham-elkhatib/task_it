import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../entities/label_entity.dart';
import '../../repositories/task_repository.dart';
import '../base/task_usecase.dart';

class AddSubtaskLabelUsecase extends UseCase<LabelEntity, SubtaskLabelParams> {
  final TaskRepository repository;

  AddSubtaskLabelUsecase(this.repository);

  @override
  Future<Either<Failure, LabelEntity>> call(SubtaskLabelParams params) {
    return repository.addSubtaskLabel(params);
  }
}
